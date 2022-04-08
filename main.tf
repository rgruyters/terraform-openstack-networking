locals {
  tags = concat(["terraform"], var.tags)
}

#
# Retrieve all availability zones
data "openstack_compute_availability_zones_v2" "all" {}

#
# Retrieve information about public network
data "openstack_networking_network_v2" "public" {
  count = var.public_network_name != "" ? 1 : 0
  name  = var.public_network_name
}

#
# Create network
resource "openstack_networking_network_v2" "this" {
  name                    = var.name
  availability_zone_hints = data.openstack_compute_availability_zones_v2.all.names

  tags = local.tags

  lifecycle {
    ignore_changes = [
      all_tags
    ]
  }
}

#
# Create subnet for network
resource "openstack_networking_subnet_v2" "this" {
  name        = "${var.name}-subnet"
  network_id  = openstack_networking_network_v2.this.id
  cidr        = var.cidr
  gateway_ip  = cidrhost(var.cidr, -2)
  enable_dhcp = true
  ip_version  = 4

  allocation_pool {
    start = cidrhost(var.cidr, 4)
    end   = cidrhost(var.cidr, -33)
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      all_tags
    ]
  }
}

#
# Create router for network
resource "openstack_networking_router_v2" "this" {
  count               = var.public_connected && var.public_network_name != "" ? 1 : 0
  name                = "${var.name}-router"
  external_network_id = data.openstack_networking_network_v2.public[0].id

  tags = local.tags

  lifecycle {
    ignore_changes = [
      all_tags
    ]
  }
}

#
# Bound router interface with subnet
resource "openstack_networking_router_interface_v2" "this" {
  count     = var.public_connected && var.public_network_name != "" ? 1 : 0
  router_id = openstack_networking_router_v2.this[0].id
  subnet_id = openstack_networking_subnet_v2.this.id
}

# vim: ft=tf
