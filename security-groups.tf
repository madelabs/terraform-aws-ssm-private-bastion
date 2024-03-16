
resource "aws_security_group" "bastion" {
  name        = "${var.name}-${var.environment}-security-group"
  description = "Bastion Security Group for ${var.name}-${var.environment}"
  vpc_id      = var.vpc_id

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
