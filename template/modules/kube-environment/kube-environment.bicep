param customerId string
param sharedKey string
resource kubeEnvironment 'Microsoft.Web/kubeEnvironments@2021-01-15' = {
  name: 'kube-env-dearazure-uat'
  location: resourceGroup().location
  properties: {
    type: 'managed'
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        //customerId: logAnalyticsWorkspace.properties.customerId
        //sharedKey: listKeys(logAnalyticsWorkspace.id, logAnalyticsWorkspace.apiVersion).primarySharedKey
        customerId: customerId
        sharedKey: sharedKey
      }
    }
  }
}

output kubeEnvironmentId string = kubeEnvironment.id
