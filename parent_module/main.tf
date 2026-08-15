module "RG" {
  source = "../RG" # path to your child module folder

  # Pass variables down to the child module
  rgs = {
    rg1 = {
      name     = "module-assignment1-rg"
      location = "eastus"
    }
  }
}

# Call the Subnet child module
module "Subnet" {
  source = "../Subnet"

  subnet = {
    module = {
      name                 = "subnet1"
      resource_group_name  = "module-assignment1-rg"
      virtual_network_name = "my-vnet-1"
      address_prefixes     = ["10.1.0.0/26"]
    }
  }
}
module "VNet" {
  source = "../VNet"
  vnet = {
    my-vnet-1 = {

      name                = "my-vnet-1"
      location            = "eastus"
      resource_group_name = "module-assignment1-rg"
      address_space       = ["10.1.0.0/24"]
    }
  }
}