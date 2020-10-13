provider "azurerm" {   
    version         = "=2.28.0"
    # Free trial
    subscription_id = "__subscriptionid__"
    client_id       = "__clientid__"
    client_secret   = "__clientsecret__"
    tenant_id       = "__tenantid__"
    features {}
}

