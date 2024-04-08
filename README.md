# terraform-aws-ssm-private-bastion
A Terraform module for creating an SSM private bastion host.

Connect to your RDS instance through the bastion host using the following command:

```bash
aws ssm start-session --target <BASTION-INSTANCE-ID> --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters host=\"<RDS-INSTANCE-ENDPOINT-HERE>\",portNumber=\"<RDS-PORT>\",localPortNumber=\"<LOCAL-PORT-TO-MAP>\"
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_managed_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.amazon_linux_2023](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The ID of the AMI to use for the EC2 instance. If not specified, the latest Amazon Linux 2023 AMI will be used. | `string` | `null` | no |
| <a name="input_detailed_monitoring"></a> [detailed\_monitoring](#input\_detailed\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled. | `bool` | `false` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | If true, enables EC2 instance termination protection. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment in which the resources are deployed. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of EC2 instance to launch. For example, t2.micro or t2.nano. | `string` | `"t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the EC2 instance and prefix for associated resources. | `string` | `"ssm-private-bastion"` | no |
| <a name="input_root_volume_encrypted"></a> [root\_volume\_encrypted](#input\_root\_volume\_encrypted) | If true, the root volume will be encrypted. | `bool` | `false` | no |
| <a name="input_root_volume_kms_key_id"></a> [root\_volume\_kms\_key\_id](#input\_root\_volume\_kms\_key\_id) | The ARN of the KMS key to use for root volume encryption. If not specified, the default KMS key for EBS will be used. | `string` | `""` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | The size of the root volume in gigabytes. | `number` | `30` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID to launch the EC2 instance in | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to launch the EC2 instance in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_instance_id"></a> [bastion\_instance\_id](#output\_bastion\_instance\_id) | n/a |
| <a name="output_bastion_private_ip"></a> [bastion\_private\_ip](#output\_bastion\_private\_ip) | n/a |
<!-- END_TF_DOCS -->