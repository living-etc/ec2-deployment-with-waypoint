data "aws_ami" "latest" {
  most_recent = true
  name_regex  = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  owners      = ["099720109477"]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "chris-wilson-terraform-remote-state"
    key    = "waypoint-demo/0_vpc"
    region = "eu-west-1"
  }
}
