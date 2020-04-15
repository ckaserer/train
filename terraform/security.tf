resource "aws_security_group" "main" {
  name        = "${var.resource_prefix}_sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow all traffic"
  
  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Created = timestamp()
    Owner   = var.owner
  }
}