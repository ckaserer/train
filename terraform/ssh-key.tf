resource "aws_key_pair" "main" {
  count = var.num_participants
  key_name   = "${var.resource_prefix}_${count.index}"
  public_key = file("workdir/${var.resource_prefix}/${count.index}/access.pub")

  tags = {
    created = timestamp()
    owner = var.owner
  }
}