resource "authentik_outpost" "this" {
  name               = var.name
  protocol_providers = var.protocol_providers

  config             = var.config
  service_connection = var.service_connection
  type               = var.type
}
