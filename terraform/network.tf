resource "aws_vpc" "main" {
  #ts:skip=AWS.VPC.Logging.Medium.0470
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "${var.resource_prefix}-vpc"
    Created = timestamp()
    Owner   = var.owner
  }
}