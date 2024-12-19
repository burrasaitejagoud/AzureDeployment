@description('Array of Key Vault configurations')
param keyVaults array

@description('Deployment location')
param location string

module keyVaultModules 'keyVault.bicep' = [for kv in keyVaults: {
  name: '${kv.name}-module'
  params: {
    name: kv.name
    location: location
    accessPolicies: kv.accessPolicies
    tags: kv.tags
  }
}]

output deployedKeyVaults array = [for (kv, index) in keyVaults: {
  name: kv.name
  id: keyVaultModules[index].outputs.keyVaultId
}]
