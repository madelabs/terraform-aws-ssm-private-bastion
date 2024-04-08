resource "aws_instance" "bastion" {
  ami                         = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux_2023.id
  associate_public_ip_address = false
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  monitoring                  = var.detailed_monitoring

  root_block_device {
    volume_size = var.root_volume_size
    encrypted   = var.root_volume_encrypted
    kms_key_id  = var.root_volume_kms_key_id
  }


  volume_tags = {
    Name       = "${var.name}-${var.environment}-root-volume"
    managed-by = "terraform"
  }

  tags = {
    Name       = "${var.name}-${var.environment}"
    managed-by = "terraform"
  }
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-*-x86_64"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}
