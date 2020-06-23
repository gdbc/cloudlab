provider "azurerm" {
      features {}
}

data "azurerm_subnet" "netsub" {
  name                 = var.subnet
  virtual_network_name = var.network_name
  resource_group_name  = var.resource_group
}

resource "azurerm_network_interface" "main" {
      count                = var.instance_count
      name                 = "${var.prefix}-${format(count.index)}-nic"
      resource_group_name  = "${var.resource_group}"
      location             = var.location

      ip_configuration {
         name              = "primary"
         subnet_id         = data.azurerm_subnet.netsub.id
         private_ip_address_allocation = "Dynamic"
      }   
}

resource "azurerm_linux_virtual_machine" "main" {
  count                    = var.instance_count
  name                     = "${var.prefix}-rke-vm${format(count.index)}"
  resource_group_name      = "${var.resource_group}"
  location                 = var.location
  admin_username           = "${var.admin_username}"
  admin_password           = "${var.admin_password}"
  disable_password_authentication = false
  size                     = "Standard_F2"
  network_interface_ids    = [
    azurerm_network_interface.main[count.index].id
  ]

  provisioner "local-exec" {
        command        = "az vm run-command invoke -g ${var.resource_group} -n ${var.prefix}-rke-vm${format(count.index)} --command-id RunShellScript --scripts @configure_docker.sh  --parameters ${var.admin_username}"
 }  

 plan {
    name                 = "centos7-min"
    product              = "centos70-min"
    publisher            = "tunnelbiz"
 }

 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
 }


 source_image_reference {
    publisher     = "tunnelbiz"
    offer         = "centos70-min"
    sku           = "centos7-min"
    version       = "0.1.1"
  }


}
