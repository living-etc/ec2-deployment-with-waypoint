terraform {
  required_version = "0.14.4"

  backend "s3" {
    bucket = "chris-wilson-terraform-remote-state"
    key    = "waypoint-demo/1_ec2"
    region = "eu-west-1"
    acl    = "bucket-owner-full-control"
  }
}
