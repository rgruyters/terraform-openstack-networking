output "network_id" {
  description = "The ID of the network"
  value       = module.networking.network_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.networking.subnet_id
}

output "router_id" {
  description = "The ID of the created router"
  value       = module.networking.router_id
}

output "subnet_pool_start" {
  description = "The start IP address of the allocated subnet"
  value       = module.networking.subnet_pool_start
}

output "subnet_pool_end" {
  description = "The end IP address of the allocated subnet"
  value       = module.networking.subnet_pool_end
}

# vim: ft=tf
