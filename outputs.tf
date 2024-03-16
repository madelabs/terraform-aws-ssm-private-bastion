output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "bastion_private_ip" {
  value = aws_instance.bastion.private_ip
}

output "ssm_connection_command" {
  value = "aws ssm start-session --target ${aws_instance.bastion.id} --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters host=\"<YOUR RDS ENDPOINT HERE>\",portNumber=\"5432\",localPortNumber=\"5432\""
}
