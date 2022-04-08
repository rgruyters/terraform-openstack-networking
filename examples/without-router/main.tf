provider "openstack" {}

module "networking" {
  source = "../../"

  name = "withoutrouter-example"
  cidr = "192.168.0.0/24"
}

# vim: ft=tf
