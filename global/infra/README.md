# Terraform Global Infrastructure Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns"></a> [dns](#module\_dns) | github.com/osinfra-io/terraform-google-cloud-dns//global | v0.1.0 |
| <a name="module_gke_fleet_host_project"></a> [gke\_fleet\_host\_project](#module\_gke\_fleet\_host\_project) | github.com/osinfra-io/terraform-google-project//global | v0.1.9 |
| <a name="module_gke_fleet_member_project"></a> [gke\_fleet\_member\_project](#module\_gke\_fleet\_member\_project) | github.com/osinfra-io/terraform-google-project//global | v0.1.9 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/osinfra-io/terraform-google-vpc//global | v0.1.1 |
| <a name="module_vpc_host_project"></a> [vpc\_host\_project](#module\_vpc\_host\_project) | github.com/osinfra-io/terraform-google-project//global | v0.1.9 |

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.service_network_peering_range](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_shared_vpc_service_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_project_iam_member.container_engine_firewall_management](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.container_engine_service_agent_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_networking_connection.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The alphanumeric ID of the billing account this project belongs to | `string` | n/a | yes |
| <a name="input_cis_2_2_logging_sink_project_id"></a> [cis\_2\_2\_logging\_sink\_project\_id](#input\_cis\_2\_2\_logging\_sink\_project\_id) | The CIS 2.2 logging sink benchmark project ID | `string` | n/a | yes |
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog APP key | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment suffix for example: `sb` (Sandbox), `nonprod` (Non-Production), `prod` (Production) | `string` | `"sb"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The numeric ID of the folder this project should be created under. Only one of `org_id` or `folder_id` may be specified | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gke_fleet_host_project_id"></a> [gke\_fleet\_host\_project\_id](#output\_gke\_fleet\_host\_project\_id) | The ID of the GKE Fleet Host Project |
| <a name="output_gke_fleet_member_project_id"></a> [gke\_fleet\_member\_project\_id](#output\_gke\_fleet\_member\_project\_id) | The ID of the GKE Fleet Service Project |
| <a name="output_vpc_host_project_id"></a> [vpc\_host\_project\_id](#output\_vpc\_host\_project\_id) | The ID of the VPC Host Project |
| <a name="output_vpc_service_project_ids"></a> [vpc\_service\_project\_ids](#output\_vpc\_service\_project\_ids) | The ID of the VPC Service Project |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
