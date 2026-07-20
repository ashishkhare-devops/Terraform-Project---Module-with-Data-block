resource_groups = {
  rg1 = {
    name     = "rg-usa"
    location = "centralus"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-usa"
    location            = "centralus"
    resource_group_name = "rg-usa"
    address_space       = ["10.0.0.0/16"]
  }

}

subnet = {
  snet1 = {
    name                 = "frontend-subnet-usa"
    resource_group_name  = "rg-usa"
    virtual_network_name = "vnet-usa"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "backend-subnet-usa"
    resource_group_name  = "rg-usa"
    virtual_network_name = "vnet-usa"
    address_prefixes     = ["10.0.2.0/24"]
  }

  snet3 = {
    name                 = "azure_bastion-subnet-usa"
    resource_group_name  = "rg-usa"
    virtual_network_name = "vnet-usa"
    address_prefixes     = ["10.0.3.0/26"]
  }

}

public_ip = {
  pip1 = {
    name                = "pip1"
    location            = "centralus"
    resource_group_name = "rg-usa"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "pip2"
    location            = "centralus"
    resource_group_name = "rg-usa"
    allocation_method   = "Static"
  }

  pip3 = {
    name                = "pip3"
    location            = "centralus"
    resource_group_name = "rg-usa"
    allocation_method   = "Static"
  }
}

network_interfaces = {
  nic1 = {
    name                = "frontend-nic"
    location            = "centralus"
    resource_group_name = "rg-usa"

    subnet_name          = "frontend-subnet-usa"
    pip_name             = "pip1"
    virtual_network_name = "vnet-usa"
  }

  nic2 = {
    name                = "backend-nic"
    location            = "centralus"
    resource_group_name = "rg-usa"

    subnet_name          = "backend-subnet-usa"
    pip_name             = "pip2"
    virtual_network_name = "vnet-usa"
  }

}

virtual_machines = {
  vm1 = {
    name                = "frontend-vm"
    location            = "centralus"
    resource_group_name = "rg-usa"
    #network_interface_ids = [
    #"/subscriptions/0e875bbd-e28b-4ff4-a774-cdd3d4522a85/resourceGroups/usa/providers/Microsoft.Network/networkInterfaces/nic1"
    #]
    network_interface_name = "frontend-nic"
    vm_size                = "Standard_D2s_v7"
    admin_username         = "adminuser"
    admin_password         = "P@ssw0rd1234!"
  }

  vm2 = {
    name                = "backend-vm"
    location            = "centralus"
    resource_group_name = "rg-usa"
    #network_interface_ids = [
    #"/subscriptions/0e875bbd-e28b-4ff4-a774-cdd3d4522a85/resourceGroups/usa/providers/Microsoft.Network/networkInterfaces/nic2"
    #]
    network_interface_name = "backend-nic"
    vm_size                = "Standard_D2s_v7"
    admin_username         = "adminuser"
    admin_password         = "P@ssw0rd1234!"
  }
}