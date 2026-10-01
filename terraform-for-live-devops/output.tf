output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my-testing-ec2.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.my-testing-ec2.public_dns
}

output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.my-testing-ec2.private_ip
}
