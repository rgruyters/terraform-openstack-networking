output "network_id" {
  description = "The ID of the network"
  value       = openstack_networking_network_v2.this.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = openstack_networking_subnet_v2.this.id
}

output "router_id" {
  description = "The ID of the created router (if enabled)"
  value       = try(openstack_networking_router_v2.this[0].id, "")
}

output "subnet_pool_start" {
  description = "The start IP address of the allocated subnet"
  value       = openstack_networking_subnet_v2.this.allocation_pools[0].start
}

output "subnet_pool_end" {
  description = "The end IP address of the allocated subnet"
  value       = openstack_networking_subnet_v2.this.allocation_pools[0].end
}

# vim: ft=tf
