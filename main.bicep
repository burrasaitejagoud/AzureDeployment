@description('Name of the Azure Key Vault')
param keyVaultName string

@description('Location of the Azure Key Vault')
param location string = resourceGroup().location

@description('SKU for the Azure Key Vault (standard or premium)')
param skuName string = 'standard'

@description('Enable purge protection for the Key Vault')
param enablePurgeProtection bool = true

@description('Tenant ID of the Azure Active Directory')
param tenantId string = subscription().tenantId

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    tenantId: tenantId
    enableSoftDelete: true
    enablePurgeProtection: enablePurgeProtection
  }
}

output keyVaultUri string = keyVault.properties.vaultUri
