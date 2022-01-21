targetScope = 'resourceGroup'

param subscriptionId string = '063b5823-d9ca-45bb-b69e-de2f963f65ee'
param keyVaultName string = 'kv-dapr'
param keyVaultResourceGroupName string = 'rgp-keyvaults-dapr'
param storageAccountName string = 'stgemployee'
param storageAccountResourceGroupName string = 'rgp-icontoso'
param imageName string 


resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' existing = {
  name: keyVaultName
  scope: resourceGroup(subscriptionId, keyVaultResourceGroupName)
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
  name: storageAccountName
  scope: resourceGroup(subscriptionId,storageAccountResourceGroupName)
}

module logAnalytics 'modules/log-analytics/log-analytics.bicep' = {
  name: 'loganalytics'
}

module kubeEnvironment 'modules/kube-environment/kube-environment.bicep' = {
  name: 'kubeenvironment'
  params: {
    customerId: logAnalytics.outputs.customerId
    sharedKey: logAnalytics.outputs.primarySharedKey
  }
}

module containerapps './modules/container-apps/containerapps.bicep' = {
  name: 'containerenvironments'
  params: {
    dockerRegistryPassword: keyVault.getSecret('dockerRegistryPassword', '38ade674c03e4e379f4340ec6276d645')
    dockerRegistryUserName: keyVault.getSecret('dockerRegistryUserName', '2022b74430e24c8488d6dc9023f2a3e3')
    kubeEnvironment: kubeEnvironment.outputs.kubeEnvironmentId
    storageAccountKey: listKeys(storageAccount.id, storageAccount.apiVersion).keys[0].value
    storageAccountName : storageAccount.name
    tableName: 'icontoso'
    imageName: imageName
  }
  dependsOn:[
    storageAccount
  ]
}

output keyvault string = keyVault.id
