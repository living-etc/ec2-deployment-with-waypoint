terraform {
  required_version = "0.14.4"

  backend "s3" {
    bucket = "chris-wilson-terraform-remote-state"
    key    = "ec2-deployment-with-waypoint/0_vpc"
    region = "eu-west-1"
  }
}
