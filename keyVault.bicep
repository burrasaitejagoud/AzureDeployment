// keyVault.bicep
@description('Name of the Key Vault')
param name string

@description('Location of the Key Vault')
param location string

@description('Access Policies for the Key Vault')
param accessPolicies array = []

@description('Tags for the Key Vault')
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2022-11-01' = {
  name: name
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: accessPolicies
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
  }
  tags: tags
}

output keyVaultId string = keyVault.id
