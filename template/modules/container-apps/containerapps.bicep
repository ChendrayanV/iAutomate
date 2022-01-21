param kubeEnvironment string
param storageAccountName string
param storageAccountKey string
param tableName string
param imageName string
@description('Docker Registry Password from Keyvault')
@secure()
param dockerRegistryPassword string
@description('Docker Registry User Name from Keyvault')
@secure()
param dockerRegistryUserName string

resource containerAppService 'Microsoft.Web/containerapps@2021-03-01' = {
  name: 'dearazure'
  location: resourceGroup().location
  kind: 'containerapp'
  properties: {
    kubeEnvironmentId: kubeEnvironment
    configuration: {
      secrets: [
        {
          name: 'container-registry-password'
          value: dockerRegistryPassword
        }
      ]
      registries: [
        {
          server: 'docker.io'
          username: dockerRegistryUserName
          PasswordSecretRef: 'container-registry-password'
        }
      ]
      ingress: {
        external: true
        targetPort: 80
        transport: 'auto'
      }
    }
    template: {
      containers: [
        {
          image: imageName
          name: 'icontoso'
          resources: {
            cpu: '.25'
            memory: '.5Gi'
          }
        }
      ]
      scale: {
        minReplicas: 2
        maxReplicas: 4
      }
      dapr: {
        enabled: true
        appPort: 80
        appId: 'icontoso'
        components: [
          {
            name: 'statestore'
            type: 'state.azure.tablestorage'
            version: 'v1'
            metadata: [
              {
                name: 'accountName'
                value: storageAccountName
              }
              {
                name: 'accountKey'
                value: storageAccountKey
              }
              {
                name: 'tableName'
                value: tableName
              }
            ]
          }
        ]
      }
    }
  }
}
