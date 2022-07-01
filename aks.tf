resource "azurerm_kubernetes_cluster" "example" {
   name                = "temp-ansible"
   location            = "East US"
   resource_group_name = "Deployment"
   dns_prefix          = "exampleaks1"
   identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_NC6"
  }

}
resource "azurerm_kubernetes_cluster" "example2" {
   name                = "cpu_task"
   location            = "East US"
   resource_group_name = "Deployment"
   dns_prefix          = "exampleaks1"
   identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_NC6"
  }
lifecycle {
    ignore_changes = all
  }
}