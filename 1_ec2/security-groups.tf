module "load_balancer_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/https-443"

  name        = "${local.project_name}-load-balancer"
  description = "Security group for the Waypoint demo load balancer"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "instance_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "${local.project_name}-instance"
  description = "Security group for the Waypoint demo instances"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = "${module.load_balancer_security_group.this_security_group_id}"
    }
  ]
}
