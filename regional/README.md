# Terraform Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.24.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnets"></a> [subnets](#module\_subnets) | github.com/osinfra-io/terraform-google-subnet//regional | v0.1.1 |

## Resources

| Name | Type |
|------|------|
| [google_artifact_registry_repository.docker_remote](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |
| [google_artifact_registry_repository.docker_standard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |
| [google_artifact_registry_repository.docker_virtual](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |
| [google_compute_subnetwork_iam_member.cloud_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [google_compute_subnetwork_iam_member.container_engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_member) | resource |
| [terraform_remote_state.global](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_google_compute_subnetwork_iam_members"></a> [google\_compute\_subnetwork\_iam\_members](#input\_google\_compute\_subnetwork\_iam\_members) | A map of IAM members to add to the subnetwork | <pre>map(object({<br>    project_number = string<br>  }))</pre> | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The region for this subnetwork | `string` | n/a | yes |
| <a name="input_remote_bucket"></a> [remote\_bucket](#input\_remote\_bucket) | The remote bucket the `terraform_remote_state` data source retrieves the state from | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The map of subnets to create | <pre>map(object({<br>    ip_cidr_range          = string<br>    service_project_number = string<br>    master_ip_cidr_range   = string<br>    pod_ip_cidr_range      = string<br>    services_ip_cidr_range = string<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
