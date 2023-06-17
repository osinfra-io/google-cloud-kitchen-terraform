# <img align="left" width="45" height="45" src="https://user-images.githubusercontent.com/1610100/202321831-9cf218f9-660d-481f-8578-c2ba19fcc93a.png"> Google Cloud Platform - Kitchen-Terraform

**[GitHub Actions](https://github.com/osinfra-io/google-cloud-kitchen-terraform/actions):**

[![Dependabot](https://github.com/osinfra-io/google-cloud-kitchen-terraform/actions/workflows/dependabot.yml/badge.svg)](https://github.com/osinfra-io/google-cloud-kitchen-terraform/actions/workflows/dependabot.yml)

**[Infracost](https://www.infracost.io):**

[![infracost](https://img.shields.io/endpoint?url=https://dashboard.api.infracost.io/shields/json/cbeecfe3-576f-4553-984c-e451a575ee47/repos/f4bdf9b0-5bfb-415d-b1e6-a39a7be8404b/branch/56bee23d-a0d4-4c85-af1f-98cec8bfa7f6)](https://dashboard.infracost.io/org/osinfra-io/repos/f4bdf9b0-5bfb-415d-b1e6-a39a7be8404b?tab=settings)

## Repository Description

This repository creates a project for [Kitchen-Terraform](https://newcontext-oss.github.io/kitchen-terraform/) to test [Terraform](https://www.terraform.io/) child modules. It also creates any required infrastructure to run the tests.

## <img align="left" width="35" height="35" src="https://user-images.githubusercontent.com/1610100/209029142-410349b7-4b22-40a9-9d4d-729f07e2b4a2.png"> Development

>Open Source Infrastructure (as code) is a development model for infrastructure that focuses on open collaboration applying relative lessons learned from software development practices that organizations can use internally at scale. - [Open Source Infrastructure (as Code)](https://www.osinfra.io)

To avoid slowing down [stream-aligned](https://teamtopologies.com/key-concepts) teams, we want to open up the possibility for contributions. The Open Source Infrastructure (as Code) model allows team members external to the platform team to contribute with only a slight increase in cognitive load. This section is for developers who want to contribute to this repository describing the tools used, the skills, and the knowledge required, along with Terraform documentation.

See the documentation for setting up a local development environment [here](https://docs.osinfra.io/development-setup).

### Tools

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)

### Terraform Documentation

- [global](global/infra/README.md)
- [regional](regional/infra/README.md)
