# terraform-authentik-outpost

Terraform module to manage the following Twingate resources:

* authentik_outpost

## Usage

Copy and paste the following code snippet to your Terraform configuration,
specify the required variables and run the command `terraform init`.

```hcl
module "authentik_provider_proxy" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-authentik-provider-proxy/local"
  version = "1.0.0"

  name               = "example-provider-proxy"
  external_host      = "https://example.com"
  authorization_flow = "8dd2dda7-5624-4f42-8984-04139ce50236"
  invalidation_flow  = "742a8bb5-3981-44ab-949f-dada3e92daf9"

  internal_host = "https://localhost"
}

module "authentik_outpost" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-authentik-outpost/local"
  version = "1.0.0"

  name = "example-outpost"
  protocol_providers = [
    module.authentik_provider_proxy.id
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_authentik"></a> [authentik](#requirement\_authentik) | ~> 2024.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_authentik"></a> [authentik](#provider\_authentik) | ~> 2024.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [authentik_outpost.this](https://registry.terraform.io/providers/goauthentik/authentik/latest/docs/resources/outpost) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Custom configuration definition for the outpost | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the outpost | `string` | n/a | yes |
| <a name="input_protocol_providers"></a> [protocol\_providers](#input\_protocol\_providers) | List of providers to apply to this outpost | `list(number)` | n/a | yes |
| <a name="input_service_connection"></a> [service\_connection](#input\_service\_connection) | The integration used to manage the outpost | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of provider used by the application | `string` | `"proxy"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [Dennis Hoppe](https://gitlab.com/dhoppeIT).

## License

Apache 2 licensed. See [LICENSE](LICENSE) for full details.
