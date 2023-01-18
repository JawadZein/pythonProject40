resource virtualmachine 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 
  location: 
  properties:{
    
  }
  resource install 'extensions' = {
    name: 
    location:
    properties:{
      
    }
  }
}

output cildresource string = virtualmachine :: install.id

