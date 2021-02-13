module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  name      = local.project_name
  create_lc = false

  image_id        = data.aws_ami.latest.id
  instance_type   = "t2.micro"
  security_groups = [module.load_balancer_security_group.this_security_group_id]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = local.project_name
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.private_subnets
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 0
  desired_capacity          = 0
  wait_for_capacity_timeout = 0
}
