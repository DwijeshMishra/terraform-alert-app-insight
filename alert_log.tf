resource "azurerm_monitor_scheduled_query_rules_alert" "example" {
  name                = "alert5"
  location            = var.location
  resource_group_name = "Deployment"

 action {
    action_group = [azurerm_monitor_action_group.alertactiongroup.id]
  }
  
  data_source_id = azurerm_kubernetes_cluster.example2.id
  description    = "Alert when total results cross threshold"
  enabled        = true
  # Count all requests with server error result code grouped into 5-minute bins
  query       = <<-QUERY
let startTimestamp = ago(5d);
KubePodInventory
| where TimeGenerated > startTimestamp
| project ContainerID, PodName=Name, PodLabel, PodLabelJson=parsejson(PodLabel)
| where PodLabelJson[0]["app"] == "backend"
| distinct ContainerID, PodName, PodLabel
| join
(
    ContainerLog
    | where TimeGenerated > startTimestamp
)
on ContainerID
| project TimeGenerated, PodName, LogEntry, LogEntrySource, PodLabel
| order by TimeGenerated desc
  QUERY
  severity    = 1
  frequency   = 5
  time_window = 30
  trigger {
    operator  = "GreaterThan"
    threshold = 0
  } 
}