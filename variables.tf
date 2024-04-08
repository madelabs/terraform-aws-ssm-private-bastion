
variable "instance_type" {
  description = "The type of EC2 instance to launch. For example, t2.micro or t2.nano."
  type        = string
  default     = "t3.micro"

}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance. If not specified, the latest Amazon Linux 2023 AMI will be used."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the EC2 instance and prefix for associated resources."
  type        = string
  default     = "ssm-private-bastion"
}

variable "environment" {
  description = "The environment in which the resources are deployed."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in"
  type        = string

  validation {
    condition     = can(regex("^subnet-[a-fA-F0-9]+$", var.subnet_id))
    error_message = "The subnet ID must be in the format 'subnet-xxxxxxxx', where 'xxxxxxxx' is a combination of letters and numbers."
  }
}

variable "disable_api_termination" {
  description = "If true, enables EC2 instance termination protection."
  type        = bool
  default     = false
}

variable "detailed_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "The size of the root volume in gigabytes."
  type        = number
  default     = 30
}

variable "root_volume_encrypted" {
  description = "If true, the root volume will be encrypted."
  type        = bool
  default     = false
}

variable "root_volume_kms_key_id" {
  description = "The ARN of the KMS key to use for root volume encryption. If not specified, the default KMS key for EBS will be used."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC to launch the EC2 instance in."
  type        = string
}


