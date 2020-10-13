provider "azurerm" {   
    version         = "=2.28.0"
    # Free trial
    subscription_id = "__subscription_id__"
    client_id       = "__client_id__"
    client_secret   = "__client_secret__"
    tenant_id       = "__tenant_id__"
    features {}
}

