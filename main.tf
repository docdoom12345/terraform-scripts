#az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/d2754f44-d5b7-4a05-bfeb-a8774d9eb4be"
/*{
  "appId": "c3404ed7-7323-42c1-9e12-34795eaddad6",
  "displayName": "azure-cli-2022-11-07-10-36-43",
  "password": "9ZJ8Q~pJB.bT3wQpVDxKG68j19fJnj7Ea1hKlc3j",
  "tenant": "cea297cb-9bde-428d-9a6e-48fa9c582ed6"
}*/
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.1.0" #change azurerm version
    }
  }
  required_version = ">=1.1.0" #restricting terraform version
}

provider "azurerm" {
  features {}
  alias = "dev"
  subscription_id = "d2754f44-d5b7-4a05-bfeb-a8774d9eb4be"     #subscription ID
  client_id       = "c3404ed7-7323-42c1-9e12-34795eaddad6"     #appid
  client_secret   = "9ZJ8Q~pJB.bT3wQpVDxKG68j19fJnj7Ea1hKlc3j" #password
  tenant_id       = "cea297cb-9bde-428d-9a6e-48fa9c582ed6"     #tenant 
}
resource "azurerm_resource_group" "example" {
  provider = azurerm.dev
  name     = var.rgname
  location = var.rglocation
}