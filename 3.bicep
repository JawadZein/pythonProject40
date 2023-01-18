resource vm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: 
  location: 
  properties:{
    
  }

}
resource install 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  name: '$(vm.name)/install'
  location:location
  properties:{
    
  }
}

output cildresource string = virtualmachine :: install.id

