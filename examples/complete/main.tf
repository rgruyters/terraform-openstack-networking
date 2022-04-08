provider "openstack" {}

module "networking" {
  source = "../../"

  name                = "complete-example"
  cidr                = "192.168.0.0/24"
  public_connected    = true
  public_network_name = "public"

  tags = ["staging"]
}

# vim: ft=tf
