# # what we need is
# key pair(login)

resource "aws_key_pair" "my_key" {
  key_name   = "my-ec2-key"
  public_key = file("my-ec2-key.pub")

}
# VPC & security group-------------------------------->
resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "my-automate-SG" {
  name        = "automate-SG"
  description = "created with Terraform practice"
  vpc_id      = aws_default_vpc.default_vpc.id

  # inbound rules------------------------------------->
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow SSH"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow HTTP"
  }

  #egress---------------------------------------------->
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all outbound traffic"
  }
}
# ec2 all info----------------------------------------->

resource "aws_instance" "my-testing-ec2" {
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my-automate-SG.name]
  instance_type   = "t3.micro"
  ami             = "ami-01a00762f46d584a1" #ubuntu

  root_block_device {
    volume_size = var.env == "prod" ? 30 : var.ec2_default_storage_size
    volume_type = "gp3"
  }
  tags = {
    Name = "my-automate-instance-01"
  }

}
