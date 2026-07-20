module "resource_group" {
  source = "../../Child Modules/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../Child Modules/azurerm_virtual_network"
  vnets      = var.virtual_networks
}

module "subnet" {
  depends_on = [module.virtual_network, module.resource_group]
  source     = "../../Child Modules/azurerm_subnet"
  snets      = var.subnet
}

module "linux_virtual_machine" {
  depends_on = [module.subnet, module.network_interface, module.public_ip, module.resource_group, module.virtual_network]
  source     = "../../Child Modules/azurerm_linux_virtual_machine"
  vms        = var.virtual_machines

}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../Child Modules/azurerm_network_interface"
  nics       = var.network_interfaces
}

module "public_ip" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet]
  source     = "../../Child Modules/azurerm_public_ip"
  pips       = var.public_ip

}