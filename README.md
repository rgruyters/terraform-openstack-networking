# OpenStack VPC Terraform Module
## Usage

```hcl
module "vpc" {
  source              = "./modules/terraform-openstack-modules/terraform-openstack-vpc"
  name                = "my-vpc"
  cidr                = "192.168.0.0/24"
  public_network_name = "public"

  tags = ["staging", "web"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 1.35.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | >= 1.35.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_networking_network_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_network_v2) | resource |
| [openstack_networking_router_interface_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_interface_v2) | resource |
| [openstack_networking_router_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_router_v2) | resource |
| [openstack_networking_subnet_v2.this](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/networking_subnet_v2) | resource |
| [openstack_compute_availability_zones_v2.all](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/compute_availability_zones_v2) | data source |
| [openstack_networking_network_v2.public](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/networking_network_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the network. Default value is a valid CIDR, but can be changed by means | `string` | `"192.168.0.0/24"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of private network | `string` | n/a | yes |
| <a name="input_public_connected"></a> [public\_connected](#input\_public\_connected) | Connect to public network | `bool` | `false` | no |
| <a name="input_public_network_name"></a> [public\_network\_name](#input\_public\_network\_name) | Name of the public network | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of strings as tags to add to all resources | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | The ID of the network |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | The ID of the created router (if enabled) |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of the subnet |
| <a name="output_subnet_pool_end"></a> [subnet\_pool\_end](#output\_subnet\_pool\_end) | The end IP address of the allocated subnet |
| <a name="output_subnet_pool_start"></a> [subnet\_pool\_start](#output\_subnet\_pool\_start) | The start IP address of the allocated subnet |
