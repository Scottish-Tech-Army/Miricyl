# Aidan Bree - January 2021
# Almost everything is automated - search for *manual* for anything that couldn't not be delivered in coede


locals{
# These are pipeline variables that are injected at runtime
    pipeline_email           = "__email__"                  //token __email__
    pipeline_zone            = "__zone__"                   //token __zone__
    pipeline_dbadminpassword = "__dbadminpassword__"        //token __dbadminpassword__
    pipeline_dbadmin         = "__dbadmin__"                //token __dbadmin__
    zone                     = "__zone__"                   //token __zone__
# The 'zone' is either p for Production np for non-production
# The zone is populated by the pipeline allowing the same code to be used in both zones 
    prefix                   = "miricyl"
    primary_location         = "uksouth"
    log_retention_in_days    = 30
    dns_zone_name = {
      np =  "np"
      p  = "help"
    }
    vnet_address_range = {
          p  = ["10.0.0.0/16"]
          np = ["10.0.0.0/16"]
    }
    primesubnet_address_range = {
          p  = ["10.0.1.0/24"]
          np = ["10.0.1.0/24"]
    }
    gatewaysubnet_address_range = {
          p  = ["10.0.2.0/24"]
          np = ["10.0.2.0/24"]
    }
# Environments are deployed per zone. An additional environment can be added by adding to the list
    environments = {
          np = {
              1 = "dev"
              2 = "int"
              3 = "pre" 
              4 = "dem"
              5 = "uat"
          }
          p = {
              1  = "help"
          }
    }

# --remove
    /*
    custom_domain = {
      np = {
        npmiricyltesting = "testing.miricyl.org"
        devmiricylclient = "dev.miricyl.org"
        intmiricylclient = "int.miricyl.org"
        premiricylclient = "pre.np.miricyl.org"
        uatmiricylclient = "uat.miricyl.org"
      }
      p = {
        prodmiricylclient = "help.miricyl.org"
      }
    }
    */
    tags = {
      zone = local.zone
    }

# In order that the terraform code can provide permission to the Azure DevOps service principal,
# this needs to be identified here. The name matches the SP within Azure Active Directory per zone
   azuread_service_principal_displayname = {
      np  = "miricyl-devops-np"
      p   = "miricyl-devops-p"
    }
  }

# Resource group is created for networking per zone
resource "azurerm_resource_group" "networking" {
  name                  = "${local.zone}-${local.prefix}-az-network-rg"
  location              = local.primary_location
  tags                  = local.tags
}

# Azure DNS is deployed into each zone - There must be a nameserver record from the existing DNS pointing to this (in google dns)
resource "azurerm_dns_zone" "miricyl" {
  name                  = "${lookup(local.dns_zone_name,local.zone)}.${local.prefix}.org"
  resource_group_name   = azurerm_resource_group.networking.name
  tags                  = local.tags
}

# DNS records are created for each environment that point at the App Gateway
resource "azurerm_dns_cname_record" "miricyl" {
  for_each            = lookup(local.environments, local.zone)
  name                = each.value
  zone_name           = azurerm_dns_zone.miricyl.name
  resource_group_name = azurerm_resource_group.networking.name
  ttl                 = 300
  record              = "${azurerm_public_ip.appgateway.domain_name_label}.${local.primary_location}.cloudapp.azure.com"
}

# A Vnet is deployed in the Primary location (Server Source Vnet) per zone
resource "azurerm_virtual_network" "primary_services" {
  name                  = "${local.zone}-${local.prefix}-vnet-${local.primary_location}-services"
  address_space         = lookup(local.vnet_address_range, local.zone)
  location              = local.primary_location
  resource_group_name   = azurerm_resource_group.networking.name
  tags                  = local.tags
}

# Subnet for servers in primary location per zone
resource "azurerm_subnet" "primary_services" {
  name                     = "${local.zone}-az-p-vnet-${local.primary_location}-services"
  resource_group_name      = azurerm_resource_group.networking.name
  virtual_network_name     = azurerm_virtual_network.primary_services.name
  address_prefixes         = lookup(local.primesubnet_address_range, local.zone)
  enforce_private_link_endpoint_network_policies = true 
}

# A Resource group is deployed for storage accounts for logos per zone
resource "azurerm_resource_group" "primary_logos" {
  name                  = "${local.zone}-${local.prefix}-az-logos-rg"
  location              = local.primary_location
  tags                  = local.tags
}

# A storage account is created for the logos in each environment 
resource "azurerm_storage_account" "logos" {
  for_each                  = lookup(local.environments, local.zone)
  name                      = "${each.value}${local.prefix}${local.primary_location}logos"
  resource_group_name       = azurerm_resource_group.primary_logos.name
  location                  = local.primary_location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  allow_blob_public_access  = true 
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  tags                      = local.tags
}

# A public blob is created that will hold the logos
resource "azurerm_storage_container" "logosweb" {
  for_each              = lookup(local.environments, local.zone)
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.logos[each.key].name
  container_access_type = "blob"
}

# In order that we can assign permissions for the storage account, we need to gather some data
# We identify the service principal that we are going to assign the role to 
data "azurerm_client_config" "main" {}

data "azuread_service_principal" "main" {
  display_name         = lookup(local.azuread_service_principal_displayname,local.zone)
}

# To allow the pipeline to populate the logos from source control, the role is assigned
resource "azurerm_role_assignment" "logos" {
  for_each             = lookup(local.environments, local.zone)
  scope                = azurerm_storage_account.logos[each.key].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_service_principal.main.object_id
}

# A Resource group for the Web App components is created per zone
resource "azurerm_resource_group" "primary_webapp" {
  name        = "${local.zone}-${local.prefix}-az-webapp-rg"
  location    = local.primary_location
  tags        = local.tags
}

# The App Service plan is created within the zone to host web apps for the environments
resource "azurerm_app_service_plan" "primary_appservice" {
  name                  = "${local.zone}-${local.prefix}-${local.primary_location}-appservice"
  location              = local.primary_location
  resource_group_name   = azurerm_resource_group.primary_webapp.name
  kind                  = "linux"
  reserved              = true
  tags                  = local.tags
  sku {
    tier = "PremiumV2"
    size = "P1v2"
  }
}

# This is the scaling policy that ensures that we have sufficicent web capacity. This is set to max 3 to ensure that we don't run out of cash!
# The mailbox for the service gets a notification email when scale out occurs
resource "azurerm_monitor_autoscale_setting" "appservice" {
  name                = "AutoscaleSetting"
  resource_group_name = azurerm_resource_group.primary_webapp.name
  location            = local.primary_location
  target_resource_id  = azurerm_app_service_plan.primary_appservice.id

  profile {
      name    = "defaultProfile"
    capacity {
      default = 1
      minimum = 1
      maximum = 3
    }
    rule {
      metric_trigger {
        metric_name        = "CPUPercentage"
        metric_resource_id = azurerm_app_service_plan.primary_appservice.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 80
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "CPUPercentage"
        metric_resource_id = azurerm_app_service_plan.primary_appservice.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 40
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
  notification {
    email {
      send_to_subscription_administrator    = true
      send_to_subscription_co_administrator = true
      custom_emails                         = [local.pipeline_email]
    }
  }
}

# A client Web App is deployed for each environment hosted
resource "azurerm_app_service" "client" {
  for_each            = lookup(local.environments, local.zone)
  name                = "${each.value}${local.prefix}client"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  app_service_plan_id = azurerm_app_service_plan.primary_appservice.id
  https_only          = true
# The codeless application insights key is included but codeless is not currently supported by MS
# So, has been included also within the client code
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appin01.instrumentation_key
  }
  site_config {
    linux_fx_version  = "PHP|7.3"
    app_command_line  = "npm run start"
  // Terraform issue prevents this being done via code currently - This needs to be *manually* done
  ip_restriction {
    name        = "Prevent direct external access"
    service_tag = "AzureCloud"
    priority    = 500
    }
  }
}

#  A server Web App is deployed for each environment hosted
resource "azurerm_app_service" "server" {
  for_each            = lookup(local.environments, local.zone)
  name                = "${each.value}${local.prefix}server"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  app_service_plan_id = azurerm_app_service_plan.primary_appservice.id
  https_only          = true
 app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appin01.instrumentation_key
    "WEBSITES_PORT"                  = "3000"
    "PORT"                           = "3000"
    "SCM_COMMAND_IDLE_TIMEOUT"       = "1800"
  }
  site_config {
    linux_fx_version = "NODE|10.10"
    app_command_line = "npm run start"
    
   // Terraform issue prevents this being done via code currently
  ip_restriction {
    name        = "Prevent direct external access"
    service_tag = "AzureCloud"
    priority    = 500
    }
   
  }
}

#  Within each zone a Web App is created that holds the output from Automated testing
resource "azurerm_app_service" "testing" {
  name                = "${local.zone}${local.prefix}testing"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.primary_webapp.name
  app_service_plan_id = azurerm_app_service_plan.primary_appservice.id
  https_only          = true
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.appin01.instrumentation_key
    "SCM_COMMAND_IDLE_TIMEOUT"       = "1800"
  }
}

# A Resource group is created for database components in each zone
resource "azurerm_resource_group" "primary_database" {
  name                = "${local.zone}-${local.prefix}-az-database-rg"
  location            = local.primary_location
  tags                = local.tags
}

# MySQL Server is deployed within each zone and holds a database for each environment
# Whilst complete seperation between environments would be preferred, this is shared to control costs
resource "azurerm_mysql_server" "primary_server" {
  name                              = "${local.zone}-${local.prefix}-${local.primary_location}-mysqlserver"
  location                          = local.primary_location
  resource_group_name               = azurerm_resource_group.primary_database.name
  administrator_login               = local.pipeline_dbadmin
  administrator_login_password      = local.pipeline_dbadminpassword
  sku_name                          = "B_Gen5_1" // Previously "GP_Gen5_2" - lowered to contain cost
  storage_mb                        = 5120
  version                           = "8.0"
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  # Enable encryption in prod  --remove
  infrastructure_encryption_enabled = false
  # Requires a higher tier to take to make internal  -remove
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
 # ssl_minimal_tls_version_enforced = "TLS1_2"  --remove 
 # ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"  -remove
  tags                              = local.tags
}

# This firewall rule allows Azure DevOps to connect to the database server so it can populate it
# Allows Microsoft services to access the MySQL DB - https://docs.microsoft.com/en-us/rest/api/sql/firewallrules/createorupdate
resource "azurerm_mysql_firewall_rule" "primary_server" {
  name                = "msservices"
  resource_group_name = azurerm_resource_group.primary_database.name
  server_name         = azurerm_mysql_server.primary_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

/* This is done via the script
# A database is created in each environment
resource "azurerm_mysql_database" "webapp_db" {
  for_each            = lookup(local.environments, local.zone)
  name                = "${each.value}-miricyl"
  resource_group_name = azurerm_resource_group.primary_database.name
  server_name         = azurerm_mysql_server.primary_server.name
  charset             = "utf8"
  collation           = "utf8_bin"
}
*/


# A Resource group is created logging and analytics components in each zone
resource "azurerm_resource_group" "logging" {
  name                = "${local.zone}-${local.prefix}-az-logging-rg"
  location            = local.primary_location
  tags                = local.tags
}

# A log analytics workspace is deployed
resource "azurerm_log_analytics_workspace" "la01" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-la01"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.logging.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

# Diagnostics settings are applied for the client Web Apps each environment
resource "azurerm_monitor_diagnostic_setting" "client" {
  for_each                    = lookup(local.environments, local.zone)
  name                        = "logging"
  target_resource_id          = azurerm_app_service.client[each.key].id
  log_analytics_workspace_id  = azurerm_log_analytics_workspace.la01.id
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

# Diagnostics settings are applied for the server Web Apps within each environment
resource "azurerm_monitor_diagnostic_setting" "server" {
  for_each                   = lookup(local.environments, local.zone)
  name                       = "logging"
  target_resource_id         = azurerm_app_service.server[each.key].id
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


# We create an application insights workspace per zone
resource "azurerm_application_insights" "appin01" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-appinsight01"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.logging.name
  application_type    = "web"
  tags                = local.tags
}

# The client is protected by an Application Gateway
# A Resource Group is created for the Application Gateway in each zone
resource "azurerm_resource_group" "appgateway" {
  name                = "${local.zone}-${local.prefix}-az-appgateway-rg"
  location            = local.primary_location
  tags                = local.tags
}

# The Application Gateway needs a Public IP
resource "azurerm_public_ip" "appgateway" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-ip"
  resource_group_name = azurerm_resource_group.appgateway.name
  location            = local.primary_location
  allocation_method   = "Static"
  domain_name_label   = "${local.zone}-${local.prefix}-${local.primary_location}"
  sku                 = "standard"
  tags                = local.tags
}

# We need a subnet for the Application Gateway in each zone
resource "azurerm_subnet" "appgateway" {
  name                  = "${local.zone}-az-p-vnet-${local.primary_location}-appgateway"
  resource_group_name   = azurerm_resource_group.networking.name
  virtual_network_name  = azurerm_virtual_network.primary_services.name
  address_prefixes      = lookup(local.gatewaysubnet_address_range, local.zone)
}

# A Storage account is created for the Application Gateway logs
resource "azurerm_storage_account" "appgateway" {
  name                     = "${local.zone}${local.prefix}appgateway"
  resource_group_name      = azurerm_resource_group.appgateway.name
  location                 = local.primary_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags

}

# --remove switch to main log analytics
# A Storage Log Analytics Workspace is created for the Application Gateway
resource "azurerm_log_analytics_workspace" "appgateway" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-appgateway-la"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.appgateway.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

data "azurerm_client_config" "miricyl" {}

# The Application Gateway will connect to a KeyVault to retrieve a web certificate, so this is created
resource "azurerm_key_vault" "appgateway" {
  name                       = "${local.zone}${local.prefix}${local.primary_location}agwkv"
  location                   = local.primary_location
  resource_group_name        = azurerm_resource_group.appgateway.name
  tenant_id                  = data.azurerm_client_config.miricyl.tenant_id
#  soft_delete_enabled        = true 
#The EnableSoftDelete feature must be used for TLS termination to function properly. If you're configuring Key Vault soft-delete through the Portal, the retention period must be kept at 90 days, the default value. Application Gateway doesn't support a different retention period yet.
  soft_delete_retention_days = 90
  purge_protection_enabled   = false
  sku_name                   = "standard"

# --remove
  # network_acls {
  #   default_action = "Allow"
  #   bypass         = "AzureServices"
  # }

  tags = local.tags
}

resource "azurerm_key_vault_access_policy" "builder" {
  key_vault_id = azurerm_key_vault.appgateway.id
  tenant_id    = data.azurerm_client_config.miricyl.tenant_id
  object_id    = data.azurerm_client_config.miricyl.object_id

  certificate_permissions = [
    "create",
    "get",
    "list"
  ]
}

# An access policy allows the App Gateway to pull the Certificates from the vault
resource "azurerm_key_vault_access_policy" "appgateway" {
  key_vault_id = azurerm_key_vault.appgateway.id
  tenant_id    = data.azurerm_client_config.miricyl.tenant_id
  object_id    = azurerm_user_assigned_identity.appgateway.principal_id

  secret_permissions = [
    "get"
  ]
}

# This retrieves the IDs of all the certificates in the vault
data "azurerm_key_vault_certificate" "miricyl" {
for_each       = lookup(local.environments, local.zone)
  name         = "dev-np-miricyl-org"
  key_vault_id = azurerm_key_vault.appgateway.id
}

# User Assisgned Identity for Application Gateway
resource "azurerm_user_assigned_identity" "appgateway" {
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.appgateway.name
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-appgateway-usi"
  tags                = local.tags
}

# This creates the App Gateway and configures the connections
resource "azurerm_application_gateway" "miricyl" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-appgateway"
  resource_group_name = azurerm_resource_group.appgateway.name
  location            = local.primary_location
  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 1
  }

/* The intention is to run the WAF service to provide protection however it is expensive!
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 1
  }


  waf_configuration {
    enabled          = true
    firewall_mode    = "prevention"
    rule_set_type    = "OWASP"
    rule_set_version = 3.1
  }
  
*/
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.appgateway.id]
  }

  gateway_ip_configuration {
    name        = "${local.zone}-${local.prefix}-${local.primary_location}-configuration"
    subnet_id   = azurerm_subnet.appgateway.id
  }

/* --remove
dynamic "frontend_port" {
  for_each = lookup(local.environments, local.zone)
  content {
    name = "${frontend_port.value}-${local.prefix}-${local.primary_location}-client-feport"
    port = 443
  }
}
*/

frontend_port {
    name = "${local.prefix}-${local.primary_location}-feport"
    port = 443
}

frontend_port {
    name = "${local.prefix}-${local.primary_location}-feport-http"
    port = 80
}

frontend_ip_configuration {
    name                 = "${azurerm_public_ip.appgateway.name}-ipconfig"
    public_ip_address_id = azurerm_public_ip.appgateway.id
}


 dynamic "backend_address_pool" {
    for_each = lookup(local.environments, local.zone)
    content {
      name      = "${backend_address_pool.value}-client-backendaddresspool"
      fqdns     = ["${backend_address_pool.value}${local.prefix}client.azurewebsites.net"]
    }
  }

   dynamic "backend_address_pool" {
    for_each = lookup(local.environments, local.zone)
    content {
      name      = "${backend_address_pool.value}-logos-backendaddresspool"
      fqdns     = ["${backend_address_pool.value}${local.prefix}${local.primary_location}logos.blob.core.windows.net"]
    }
  }

  dynamic "probe" {
    for_each = lookup(local.environments, local.zone)
    content {
    name                                      = "${probe.value}-logos-probe"
    interval                                  = 30
    protocol                                  = "https"
    path                                      = "/"
    timeout                                   = 30
    unhealthy_threshold                       = 3
    port                                      = 443
    pick_host_name_from_backend_http_settings = true
    match {
        status_code  = ["400"]
    }
    }

  }

/* --remove
  backend_address_pool {
    name  = "${local.zone}-${local.prefix}-${local.primary_location}-backendaddresspool"
    fqdns = ["intmiricylclient.azurewebsites.net"]
  }
*/

 dynamic "http_listener"  {
   for_each                        = lookup(local.environments, local.zone)
  content {
    name                           = "${http_listener.value}-${local.prefix}-${local.primary_location}-listener"
    frontend_ip_configuration_name = "${azurerm_public_ip.appgateway.name}-ipconfig"
    frontend_port_name             = "${local.prefix}-${local.primary_location}-feport"
    protocol                       = "https"
    host_name                      = "${http_listener.value}.${local.prefix}.org"
    ssl_certificate_name           = "${http_listener.value}-miricyl-org"
  }
 }
/* --remove
  dynamic "http_listener"  {
   for_each                        = lookup(local.environments, local.zone)
  content {
    name                           = "${http_listener.value}-${local.prefix}-${local.primary_location}-listener-http"
    frontend_ip_configuration_name = "${azurerm_public_ip.appgateway.name}-ipconfig"
    frontend_port_name             = "${local.prefix}-${local.primary_location}-feport-http"
    protocol                       = "http"
   
  }
 }

*/

 dynamic "http_listener"  {
   for_each                         = lookup(local.environments, local.zone)
  content {
    name                            = "${http_listener.value}-${local.prefix}-${local.primary_location}-listener-http"
    frontend_ip_configuration_name  = "${azurerm_public_ip.appgateway.name}-ipconfig"
    frontend_port_name              = "${local.prefix}-${local.primary_location}-feport-http"
    protocol                        = "http"
    host_name                       = "${http_listener.value}.${local.prefix}.org"
  }
 }
/* --remove
http_listener  {
    name                           = "${local.prefix}-${local.primary_location}-listener-http"
    frontend_ip_configuration_name = "${azurerm_public_ip.appgateway.name}-ipconfig"
    frontend_port_name             = "${local.prefix}-${local.primary_location}-feport-http"
    protocol                       = "http"
}
*/
dynamic "request_routing_rule" {
    for_each                   = lookup(local.environments, local.zone)
    content {
    name                       = "${request_routing_rule.value}-${local.prefix}-${local.primary_location}-routingrule"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "${request_routing_rule.value}-${local.prefix}-${local.primary_location}-listener"
    url_path_map_name          = "${request_routing_rule.value}-url-path-map"
  }
}
dynamic "url_path_map" {
    for_each                   = lookup(local.environments, local.zone)
  content {
    name = "${url_path_map.value}-url-path-map"
    default_backend_address_pool_name  = "${url_path_map.value}-client-backendaddresspool"
    default_backend_http_settings_name = "https"
    path_rule {
      name  = "${url_path_map.value}-path-rule"
      paths = ["/images/*"]
      backend_address_pool_name = "${url_path_map.value}-logos-backendaddresspool"
      backend_http_settings_name = "${url_path_map.value}-logo"
    }
  }
}
dynamic "request_routing_rule" {
    for_each                      = lookup(local.environments, local.zone)
    content {
    name                          = "${request_routing_rule.value}-${local.prefix}-${local.primary_location}-routingrule-http"
    rule_type                     = "Basic"
    http_listener_name            = "${request_routing_rule.value}-${local.prefix}-${local.primary_location}-listener-http"
    redirect_configuration_name   = "${request_routing_rule.value}-${local.prefix}-${local.primary_location}-redirectrule-http"
  }

}
dynamic "redirect_configuration" {
    for_each                   = lookup(local.environments, local.zone)
    content {
    name                       = "${redirect_configuration.value}-${local.prefix}-${local.primary_location}-redirectrule-http"
    redirect_type              = "Permanent"
    include_path               = true
    include_query_string       = true
    target_listener_name       = "${redirect_configuration.value}-${local.prefix}-${local.primary_location}-listener"
    
  }
}
  backend_http_settings {
    name                  = "https"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 443
    protocol              = "https"
    request_timeout       = 60
    pick_host_name_from_backend_address = true
  }
dynamic "backend_http_settings" {
  for_each                = lookup(local.environments, local.zone)
   content {
    name                  = "${backend_http_settings.value}-logo"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 443
    protocol              = "https"
    request_timeout       = 60
    pick_host_name_from_backend_address = true
    probe_name            = "${backend_http_settings.value}-logos-probe"
  }
}
dynamic "ssl_certificate" {
    for_each              = lookup(local.environments, local.zone)
   content {
    name                  = "${ssl_certificate.value}-miricyl-org"
    key_vault_secret_id   = data.azurerm_key_vault_certificate.miricyl[ssl_certificate.key].secret_id
  }
}
}
# Enable diagnostics for back end web service in each environment
resource "azurerm_monitor_diagnostic_setting" "appgateway" {
  name                       = "logging"
  target_resource_id         = azurerm_application_gateway.miricyl.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.appgateway.id
#  storage_account_id         = azurerm_storage_account.appgateway.id  --remove

  log {
    category  = "ApplicationGatewayAccessLog"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

    log {
    category  = "ApplicationGatewayFirewallLog"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

    log {
    category  = "ApplicationGatewayPerformanceLog"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }

     metric {
    category  = "AllMetrics"
    retention_policy {
      enabled = true
      days    = local.log_retention_in_days
    }
  }
  

}

# Bot to update certs
# Resource group for ACME bot per zone
resource "azurerm_resource_group" "certbot" {
  name                  = "${local.zone}-${local.prefix}-az-certbot-rg"
  location              = local.primary_location
  tags                  = local.tags
}

# Storage account for Application Gateway logs  -- remove
resource "azurerm_storage_account" "certbot" {
  name                     = "${local.zone}${local.prefix}certbot"
  resource_group_name      = azurerm_resource_group.certbot.name
  location                 = local.primary_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.tags

}

# Create the application insights workspace for certbot per zone
resource "azurerm_application_insights" "certbot" {
  name                = "${local.zone}-${local.prefix}-${local.primary_location}-certbot"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.certbot.name
  application_type    = "web"
  tags                = local.tags
}

# The App Service plan is created within the zone for the certbot
resource "azurerm_app_service_plan" "certbot" {
  name                  = "${local.zone}-${local.prefix}-${local.primary_location}-certbot"
  location              = local.primary_location
  resource_group_name   = azurerm_resource_group.certbot.name
  kind                  = "functionapp"
  tags                  = local.tags
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

data "azurerm_subscription" "miricyl" {
}

# Note - requires configuration https://github.com/shibayan/keyvault-acmebot *manual*
# Backend web service for each environment hosted on the zone server
resource "azurerm_function_app" "certbot" {
  name                       = "${local.zone}-${local.prefix}-${local.primary_location}-certbot"
  location                   = local.primary_location
  resource_group_name        = azurerm_resource_group.certbot.name
  app_service_plan_id        = azurerm_app_service_plan.certbot.id
  storage_account_name       = azurerm_storage_account.certbot.name
  storage_account_access_key = azurerm_storage_account.certbot.primary_access_key
  version                    = "~3"
  https_only                 = true
  client_affinity_enabled    = false
  enable_builtin_logging     = false
 app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.certbot.instrumentation_key
    "FUNCTIONS_WORKER_RUNTIME"              = "dotnet"
    "WEBSITE_RUN_FROM_PACKAGE"              = "https://shibayan.blob.core.windows.net/azure-keyvault-letsencrypt/v3/latest.zip"  
    "Acmebot:AzureDns:SubscriptionId"       = data.azurerm_subscription.miricyl.subscription_id
    "Acmebot:Contacts"                      = local.pipeline_email
    "Acmebot:Endpoint"                      = "https://acme-v02.api.letsencrypt.org/"
    "Acmebot:VaultBaseUrl"                  = azurerm_key_vault.appgateway.vault_uri
    "Acmebot:Environment"                   = "AzureCloud"
 }
  identity {
    type = "SystemAssigned"
  }
  site_config {
    ftps_state = "Disabled"
  }
}


/*  --remove

Function appgateway


      "properties": {
        "serverFarmId": "[resourceId('Microsoft.Web/serverfarms', variables('appServicePlanName'))]",
        "siteConfig": {
          "appSettings": [
            {
              "name": "APPLICATIONINSIGHTS_CONNECTION_STRING",
              "value": "[concat('InstrumentationKey=', reference(resourceId('Microsoft.Insights/components', variables('appInsightsName')), '2015-05-01').InstrumentationKey, ';EndpointSuffix=', variables('appInsightsEndpoints')[environment().name])]"
            },
            {
              "name": "AzureWebJobsStorage",
              "value": "[concat('DefaultEndpointsProtocol=https;AccountName=', variables('storageAccountName'), ';AccountKey=', listKeys(variables('storageAccountId'), '2018-11-01').keys[0].value, ';EndpointSuffix=', environment().suffixes.storage)]"
            },
            {
              "name": "WEBSITE_CONTENTAZUREFILECONNECTIONSTRING",
              "value": "[concat('DefaultEndpointsProtocol=https;AccountName=', variables('storageAccountName'), ';AccountKey=', listKeys(variables('storageAccountId'), '2018-11-01').keys[0].value, ';EndpointSuffix=', environment().suffixes.storage)]"
            },
            {
              "name": "WEBSITE_CONTENTSHARE",
              "value": "[toLower(variables('functionAppName'))]"
            },
            {
              "name": "WEBSITE_RUN_FROM_PACKAGE",
              "value": "https://shibayan.blob.core.windows.net/azure-keyvault-letsencrypt/v3/latest.zip"
            },
            {
              "name": "FUNCTIONS_EXTENSION_VERSION",
              "value": "~3"
            },
            {
              "name": "FUNCTIONS_WORKER_RUNTIME",
              "value": "dotnet"
            },
            {
              "name": "Acmebot:AzureDns:SubscriptionId",
              "value": "[subscription().subscriptionId]"
            },
            {
              "name": "Acmebot:Contacts",
              "value": "[variables('mailAddress')]"
            },
            {
              "name": "Acmebot:Endpoint",
              "value": "[variables('acmeEndpoint')]"
            },
            {
              "name": "Acmebot:VaultBaseUrl",
              "value": "[if(parameters('createWithKeyVault'), concat('https://', variables('keyVaultName'), environment().suffixes.keyvaultDns), variables('vaultBaseUrl'))]"
            },
            {
              "name": "Acmebot:Environment",
              "value": "[environment().name]"
            }
          ],
          "clientAffinityEnabled": false
        },
        "ftpsState": "Disabled",
        "httpsOnly": true
      },
*/


/*
  # azurerm_subnet.primary_services will be updated in-place
  ~ resource "azurerm_subnet" "primary_services" {
        address_prefix                                 = "10.0.1.0/24"
        address_prefixes                               = [
            "10.0.1.0/24",
        ]
      ~ enforce_private_link_endpoint_network_policies = true -> false
        enforce_private_link_service_network_policies  = false
        id                                             = "/subscriptions/aebe7290-6bdc-4539-93c0-d5b66a087a46/resourceGroups/np-miricyl-az-network-rg/providers/Microsoft.Network/virtualNetworks/np-miricyl-vnet-uksouth-services/subnets/np-az-p-vnet-uksouth-services"
        name                                           = "np-az-p-vnet-uksouth-services"
        resource_group_name                            = "np-miricyl-az-network-rg"
        service_endpoints                              = []
        virtual_network_name                           = "np-miricyl-vnet-uksouth-services"
*/


# Resource group for API Management
resource "azurerm_resource_group" "apimanagement" {
  name                  = "${local.zone}-${local.prefix}-az-apimanagement-rg"
  location              = local.primary_location
  tags                  = local.tags
}

# This deploys the API management
resource "azurerm_api_management" "miricyl" {
  name                = "${local.zone}-${local.prefix}"
  location            = local.primary_location
  resource_group_name = azurerm_resource_group.apimanagement.name
  publisher_name      = "prefix"
  publisher_email     = local.pipeline_email
  sku_name            = "Consumption_0"
  tags                = local.tags
/* --remove
  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML

  }
  */
}

resource "azurerm_api_management_backend" "miricyl" {
  for_each            = lookup(local.environments, local.zone)
  name                = "${each.value}${local.prefix}-backend"
  resource_group_name = azurerm_resource_group.apimanagement.name
  resource_id         = "https://management.azure.com/subscriptions/${data.azurerm_client_config.miricyl.subscription_id}/resourceGroups/${azurerm_resource_group.primary_webapp.name}/providers/Microsoft.Web/sites/${each.value}${local.prefix}server"
  api_management_name = azurerm_api_management.miricyl.name
  protocol            = "http"
  url                 = "https://${each.value}${local.prefix}server.azurewebsites.net"
}

resource "azurerm_api_management_api" "miricyl" {
  for_each            = lookup(local.environments, local.zone)
  name                = "${local.zone}-${local.prefix}-${each.value}-api"
  resource_group_name = azurerm_resource_group.apimanagement.name
  api_management_name = azurerm_api_management.miricyl.name
  revision            = "1"
  display_name        = "${each.value}-api"
  path                = each.value
  protocols           = ["https"]
  service_url         = "https://${each.value}${local.prefix}server.azurewebsites.net/api"
  subscription_required = false

  import {
    content_format    = "openapi"
    content_value     = <<-EOT
openapi: 3.0.1
info:
  title: ${each.value}${local.prefix}server
  description: ''
  version: '1.0'
servers:
  - url: https://${local.zone}-${local.prefix}.azure-api.net/${local.prefix}
paths:
  /*:
    post:
      summary: ${each.value}${local.prefix}server_POST
      operationId: 5fc964f8ce54300cc3ac360f
      responses:
        '200':
          description: 
    get:
      summary: ${each.value}${local.prefix}server_GET
      operationId: 5fc964f84983f3f2d404a122
      responses:
        '200':
          description: 
    options:
      summary: ${each.value}${local.prefix}server_OPTIONS
      operationId: 5fc964f89ae86d8efc03128d
      responses:
        '200':
          description: 
    delete:
      summary: ${each.value}${local.prefix}server_DELETE
      operationId: 5fc964f8354886f37c7a37a1
      responses:
        '200':
          description: 
    put:
      summary: ${each.value}${local.prefix}server_PUT
      operationId: 5fc964f855935870e19da5eb
      responses:
        '200':
          description: 
    trace:
      summary: ${each.value}${local.prefix}server_TRACE
      operationId: 5fc964f8b5f632e31ca9f541
      responses:
        '200':
          description: 
    head:
      summary: ${each.value}${local.prefix}server_HEAD
      operationId: 5fc964f8ccacd26b794c8cb9
      responses:
        '200':
          description: 
    patch:
      summary: ${each.value}${local.prefix}server_PATCH
      operationId: 5fc964f8b7b86037ddbf0d25
      responses:
        '200':
          description: 
components:
  securitySchemes:
    apiKeyHeader:
      type: apiKey
      name: Ocp-Apim-Subscription-Key
      in: header
    apiKeyQuery:
      type: apiKey
      name: subscription-key
      in: query
security:
  - apiKeyHeader: [ ]
  - apiKeyQuery: [ ]
  EOT
  }

}

