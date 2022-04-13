@description('Enter a VM Name')
param devVmName string

@description('Administrator name for VMs that are created')
param vmAdminUsername string

@description('Password for the VMs that are created')
@secure()
param vmAdminPassword string

@description('The tags that will be associated to the VM')
param tags object = {
  environment: 'lab'
}

param vNetName string
param subnetName string
param vNetRg string 


// Resource location
param location string = resourceGroup().location

// Size of the Virtual Machine.
@allowed([
  'Standard_D2s_v3'
  'Standard_D4s_v3'
  'Standard_D8s_v3'
])
param virtualMachineSize string = 'Standard_D2s_v3'



resource vmSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  name: '${vNetName}/${subnetName}'
  scope: resourceGroup(vNetRg)
  
}

module devVM 'modules/VM/virtualmachine.bicep' = {
  name: devVmName
  params: {
    adminPassword: vmAdminPassword
    adminUserName: vmAdminUsername
    location: location
    subnetId: vmSubnet.id
    tags: tags
    virtualMachineSize: virtualMachineSize
    vmName: devVmName
  }
}
output subnetId string = vmSubnet.id
