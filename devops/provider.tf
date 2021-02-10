
provider "azurerm" {   
    subscription_id = "__subscriptionid__"  //token __subscriptionid__
    client_id       = "__clientid__"        //token __clientid__
    client_secret   = "__clientsecret__"    //token __clientsecret__
    tenant_id       = "__tenantid__"        //token __tenantid__
    features {}
}

provider "azuread" {
  client_id       = "__clientid__"          //token __clientid__
  client_secret   = "__clientsecret__"      //token __clientsecret__
  tenant_id       = "__tenantid__"          //token __tenantid__
}

terraform {
    required_providers {
        azurerm = {
            version         = "=2.42.0"
        }
        azuread = {
            version         = "=1.1.1"
        }
    }
    backend "azurerm" {
        resource_group_name     = "__storageresourcegroupname__"  //token __storageresourcegroupname__
        storage_account_name    = "__storageaccountname__"        //token __storageaccountname__
        container_name          = "terraform"
        key                     = "terraform.tfstate"
        access_key              =  "__storageaccesskey__"         //token __storageaccesskey__
    }
}
