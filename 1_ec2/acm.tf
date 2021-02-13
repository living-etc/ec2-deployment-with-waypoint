module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name = "*.chris-wilson-waypoint-demo.com"
  zone_id     = module.zones.this_route53_zone_zone_id[0]
}
