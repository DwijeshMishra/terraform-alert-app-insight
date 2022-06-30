resource "azurerm_monitor_scheduled_query_rules_alert" "example" {
  name                = "alert5"
  location            = var.location
  resource_group_name = var.rg_name

 action {
    action_group = [azurerm_monitor_action_group.alertactiongroup.id]
  }
  data_source_id = azurerm_application_insights.ai.id
  description    = "Alert when total results cross threshold"
  enabled        = true
  # Count all requests with server error result code grouped into 5-minute bins
  query       = <<-QUERY
  requests
    | where tolong(resultCode) >= 500
    | summarize count() by bin(timestamp, 5m)
  QUERY
  severity    = 1
  frequency   = 5
  time_window = 30
  trigger {
    operator  = "GreaterThan"
    threshold = 0
  } 
}