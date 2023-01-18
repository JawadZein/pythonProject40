var logAnalyticsWorkspaceName = 'ToyLogs'
var cosmosDBAccountDiagnosticSettingsName = 'route-logs-to-log-analytics'

resource logAnalyticsWorkspace  'Microsoft.OperationalInsights/workspaces@2022-10-01' existing = {
  name: logAnalyticsWorkspaceName
}

resource cosmosDBAccountDiagnostics 'microsoft.aadiam/diagnosticSettings@2017-04-01' = {
  scope: logAnalyticsWorkspace
  name: cosmosDBAccountDiagnosticSettingsName
  properties:{
    workspaceId: logAnalyticsWorkspace.id
    logs:[
      {
       category: 'DataPlaneRequests'
       enabled:true 
      }
    ]
  }
}
