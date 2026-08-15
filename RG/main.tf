resource "azurerm_resource_group" "module-assignment" {
  for_each = var.rgs
  name = each.value.name
  location = each.value.location
}