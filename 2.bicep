resource virtualmachine 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 
  location: 
  properties:{
    
  }
  
}
resource install 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
   parent:virtualmachine 
  name: 
    location:
    properties:{
      
    }
  }

output cildresource string = install.id

