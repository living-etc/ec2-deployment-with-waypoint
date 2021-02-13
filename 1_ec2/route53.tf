module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 1.0"

  zones = {
    "chris-wilson-waypoint-demo.com" = {
      comment = "Waypoint Demo"
    }
  }
}
