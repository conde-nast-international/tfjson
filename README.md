tfjson
======

Utility to read in a Terraform plan file and dump it out in JSON. Standalone
version of [Terraform PR #3170](https://github.com/hashicorp/terraform/pull/3170).

## Installation

```
$ go get github.com/conde-nast-international/tfjson
```

## Usage

Given the following Terraform resources:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

module "inner" {
  source = "./inner"
}

// in inner module:

resource "aws_vpc" "inner" {
  cidr_block = "10.0.0.0/8"
}
```

Running `terraform plan -out=terraform.tfplan` produces a Terraform plan file.
The JSON representation produced by `tfjson` looks like:

```json
$ tfjson terraform.tfplan
{
    "aws_vpc.main": {
        "computed": {
            "arn": true,
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": false,
            "default_network_acl_id": true,
            "default_route_table_id": true,
            "default_security_group_id": true,
            "dhcp_options_id": true,
            "enable_classiclink": true,
            "enable_classiclink_dns_support": true,
            "enable_dns_hostnames": true,
            "enable_dns_support": false,
            "id": true,
            "instance_tenancy": false,
            "ipv6_association_id": true,
            "ipv6_cidr_block": true,
            "main_route_table_id": true
        },
        "destroy": false,
        "destroy_tainted": false,
        "new": {
            "arn": "",
            "assign_generated_ipv6_cidr_block": "false",
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "",
            "default_route_table_id": "",
            "default_security_group_id": "",
            "dhcp_options_id": "",
            "enable_classiclink": "",
            "enable_classiclink_dns_support": "",
            "enable_dns_hostnames": "",
            "enable_dns_support": "true",
            "id": "",
            "instance_tenancy": "default",
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "main_route_table_id": ""
        },
        "old": {
            "arn": "",
            "assign_generated_ipv6_cidr_block": "",
            "cidr_block": "",
            "default_network_acl_id": "",
            "default_route_table_id": "",
            "default_security_group_id": "",
            "dhcp_options_id": "",
            "enable_classiclink": "",
            "enable_classiclink_dns_support": "",
            "enable_dns_hostnames": "",
            "enable_dns_support": "",
            "id": "",
            "instance_tenancy": "",
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "main_route_table_id": ""
        },
        "requires_new": true
    },
    "destroy": false,
    "inner": {
        "aws_vpc.inner": {
            "computed": {
                "arn": true,
                "assign_generated_ipv6_cidr_block": false,
                "cidr_block": false,
                "default_network_acl_id": true,
                "default_route_table_id": true,
                "default_security_group_id": true,
                "dhcp_options_id": true,
                "enable_classiclink": true,
                "enable_classiclink_dns_support": true,
                "enable_dns_hostnames": true,
                "enable_dns_support": false,
                "id": true,
                "instance_tenancy": false,
                "ipv6_association_id": true,
                "ipv6_cidr_block": true,
                "main_route_table_id": true
            },
            "destroy": false,
            "destroy_tainted": false,
            "new": {
                "arn": "",
                "assign_generated_ipv6_cidr_block": "false",
                "cidr_block": "10.0.0.0/8",
                "default_network_acl_id": "",
                "default_route_table_id": "",
                "default_security_group_id": "",
                "dhcp_options_id": "",
                "enable_classiclink": "",
                "enable_classiclink_dns_support": "",
                "enable_dns_hostnames": "",
                "enable_dns_support": "true",
                "id": "",
                "instance_tenancy": "default",
                "ipv6_association_id": "",
                "ipv6_cidr_block": "",
                "main_route_table_id": ""
            },
            "old": {
                "arn": "",
                "assign_generated_ipv6_cidr_block": "",
                "cidr_block": "",
                "default_network_acl_id": "",
                "default_route_table_id": "",
                "default_security_group_id": "",
                "dhcp_options_id": "",
                "enable_classiclink": "",
                "enable_classiclink_dns_support": "",
                "enable_dns_hostnames": "",
                "enable_dns_support": "",
                "id": "",
                "instance_tenancy": "",
                "ipv6_association_id": "",
                "ipv6_cidr_block": "",
                "main_route_table_id": ""
            },
            "requires_new": true
        },
        "destroy": false
    }
}
```

## License

This project is made available under the [MIT License](http://opensource.org/licenses/MIT).
