resource cosmosDBAccount 'Microsoft.DocumentDB/databaseAccounts@2022-08-15' = {
  name: 
  properties: {
    databaseAccountOfferType: 
    locations: 
  }
}

resource lockResource 'Microsoft.Authorization/locks@2020-05-01' = {
  scope: cosmosDBAccount
  name: 'DontDelete'
  properties: {
    level: 'CanNotDelete'
    notes: 'Prevent deletion'
  }
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' existing = {
  name: 
}
resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' existing = {
  name: 

  resource managmentsubnet 'subnets' existing = {
    name:  'managment'
  }
}

