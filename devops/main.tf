locals{
    prefix = "miricyl"
    primary_location = "uksouth"
    log_retention_in_days = 30
    tags = {
        environment = "__environment__"
    }
}

# Resource group for networking
resource "azurerm_resource_group" "networking" {
  name                = "${local.tags.environment}-${local.prefix}-az-network-rg"
  location            = local.primary_location
  tags                = local.tags
}

# Primary Site Network configuration
# Vnet in Primary location (Server Source Vnet)
resource "azurerm_virtual_network" "primary_services" {
  name                = "${local.tags.environment}-${local.prefix}-vnet-${local.primary_location}-services"
  address_space       = ["10.0.1.0/24"]
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.networking.name
  tags                = local.tags
}

# Subnet for production servers in primary location
resource "azurerm_subnet" "primary_services" {
  name                 = "${local.tags.environment}-az-p-vnet-${local.primary_location}-services"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.primary_services.name
  address_prefixes       = ["10.0.1.0/24"]
}

# Resource group for WebApp components
resource "azurerm_resource_group" "primary_webapp" {
  name                = "${local.tags.environment}-${local.prefix}-az-webapp-rg"
  location            = local.primary_location
  tags                = local.tags
}

# Create the App Service plan to host the Web App
resource "azurerm_app_service_plan" "primary_appservice" {
  name                = "${local.tags.environment}-${local.prefix}-${local.primary_location}-appservice"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  kind                = "linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
  tags                = local.tags
}

# Front end web service
resource "azurerm_app_service" "client" {
  name                = "${local.tags.environment}-${local.tags.environment}${local.prefix}client"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  app_service_plan_id = azurerm_app_service_plan.primary_appservice.id
 

 app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.appin01.instrumentation_key}"
  }

  site_config {
    linux_fx_version = "PHP|7.3"
    app_command_line = "npm run start"
/*
    ip_restriction            {
  virtual_network_subnet_id = azurerm_subnet.primary_services.id
                              }
  }
*/
  }
}

# Backend web service
resource "azurerm_app_service" "server" {
  name                = "${local.tags.environment}-${local.tags.environment}${local.prefix}server"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  app_service_plan_id = azurerm_app_service_plan.primary_appservice.id
 
 app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.appin01.instrumentation_key}"
    "WEBSITES_PORT"                  = "3000"
    "SCM_COMMAND_IDLE_TIMEOUT"       = "1800"
  }

  site_config {
    linux_fx_version = "NODE|10.10"
    app_command_line = "npm run start"

  }
  
}

# Resource group for database components
resource "azurerm_resource_group" "primary_database" {
  name                = "${local.tags.environment}-${local.prefix}-az-database-rg"
  location            = local.primary_location
  tags                = local.tags
}

# Deploy the MySQL Server
resource "azurerm_mysql_server" "primary_server" {
  name                = "${local.tags.environment}-${local.prefix}-${local.primary_location}-mysqlserver"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_database.name

  administrator_login          = "__dblogin__"
  administrator_login_password = "__dbpassword__"

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "8.0"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  # Enable encryption in prod
  infrastructure_encryption_enabled = false
  # Requires a higher tier to take to make internal
  public_network_access_enabled     = true

  ssl_enforcement_enabled           = false
  #ssl_enforcement_enabled           = true
  #ssl_minimal_tls_version_enforced  = "TLS1_2"
  ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"

# threat detection should be setup to a storage account and email alerts sent
/*
threat_detection_policy {
 enabled = false
}
*/
  tags                = local.tags
}

# Allows Microsoft services to access the MySQL DB - https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
# Required for Azure DevOps
resource "azurerm_mysql_firewall_rule" "primary_server" {
  name                = "msservices"
  resource_group_name = azurerm_resource_group.primary_database.name
  server_name         = azurerm_mysql_server.primary_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_mysql_database" "webapp_db" {
  name                = "${local.tags.environment}-miricyl"
  resource_group_name = azurerm_resource_group.primary_database.name
  server_name         = azurerm_mysql_server.primary_server.name
  charset             = "utf8"
  collation           = "utf8_bin"
}

# Resource group for logging and analytics components
resource "azurerm_resource_group" "logging" {
  name                = "${local.tags.environment}-${local.prefix}-az-logging-rg"
  location            = local.primary_location
  tags                = local.tags
}

resource "azurerm_log_analytics_workspace" "la01" {
  name                = "${local.tags.environment}-${local.prefix}-${local.primary_location}-la01"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.logging.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

# Enable diagnostics for front end client web service
resource "azurerm_monitor_diagnostic_setting" "client" {
  name               = "logging"
  target_resource_id = azurerm_app_service.client.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.la01.id

  metric {
    category  = "AllMetrics"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServiceAntivirusScanAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServiceHTTPLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {  
    category  = "AppServiceConsoleLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days

    }
  }

  log {
    category  = "AppServiceAppLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days

    }
  }

  log {
    category  = "AppServiceFileAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
  category    = "AppServiceAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServicePlatformLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }
    log {
    category  = "AppServiceIPSecAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }
}

# Enable diagnostics for back end web service
resource "azurerm_monitor_diagnostic_setting" "server" {
  name               = "logging"
  target_resource_id = azurerm_app_service.server.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.la01.id

  metric {
    category  = "AllMetrics"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServiceAntivirusScanAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServiceHTTPLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {  
    category  = "AppServiceConsoleLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days

    }
  }

  log {
    category  = "AppServiceAppLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days

    }
  }

  log {
    category  = "AppServiceFileAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
  category    = "AppServiceAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

  log {
    category  = "AppServicePlatformLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }
    log {
    category  = "AppServiceIPSecAuditLogs"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }
}

# Create the application insights workspace
resource "azurerm_application_insights" "appin01" {
  name                = "${local.tags.environment}-${local.prefix}-${local.primary_location}-appinsight01"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.logging.name
  application_type    = "web"
  tags                = local.tags
}
