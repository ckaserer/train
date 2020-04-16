output "instance_public_ips" {
  value = ["${aws_instance.main.*.public_ip}"]
}

output "instance_public_dns" {
  value = ["${aws_instance.main.*.public_dns}"]
}
