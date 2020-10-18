provider "azurerm" {   
    version         = "=2.28.0"
    subscription_id = "__subscriptionid__"
    client_id       = "__clientid__"
    client_secret   = "__clientsecret__"
    tenant_id       = "__tenantid__"
    features {}
}

terraform {
    backend "azurerm" {
        resource_group_name     = "__storageresourcegroupname__"
        storage_account_name    = "__storageaccountname__"
        container_name          = "terraform"
        key                     = "terraform.tfstate"
        access_key              =  "__storageaccesskey__"
    }
}