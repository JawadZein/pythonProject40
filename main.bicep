param cosmosDBAccountName string = 'toyrnd-${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
param cosmosDBDatabaseThroughput int = 400
var cosmosDBDatabaseName = 'FlightTests'
var cosmosDBContainerName = 'FlightTests'
var cosmosDBContainerPartitionKey = '/droneId'



resource cosmosDBAccount 'Microsoft.DocumentDB/databaseAccounts@2022-08-15' = {
  name: cosmosDBAccountName
  location:location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: location
  }
  }

resource cosmosDBDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2022-08-15' = {
  parent:cosmosDBAccount
  name: cosmosDBAccountName
  properties: {
    resource: {
      id: cosmosDBAccountName
    }
    options:{
      throughput:cosmosDBDatabaseThroughput
    }
  }
  resource container 'containers' = {
    name: cosmosDBContainerName
    properties: {
      resource: {
        id: cosmosDBContainerName
        partitionKey: {
          kind: 'Hash'
          paths:[
            cosmosDBContainerPartitionKey
          ]
        }
      }
      options: {}
    }
  }
}


