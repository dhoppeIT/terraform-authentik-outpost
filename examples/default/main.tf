module "authentik_outpost" {
  source = "../../"

  name = "example-outpost"
  protocol_providers = [
    2
  ]
}
