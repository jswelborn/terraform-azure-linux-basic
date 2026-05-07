variable "hetroot_public_key" {
  description = "Public SSH key for the hetroot user"
  type        = string
  sensitive   = true
}

variable "aap_token" {
  description = "AAP API token used to launch the linux-bootstrap workflow"
  type        = string
  sensitive   = true
}

variable "hetwinadmin_default_password" {
  description = "Initial local admin password for Windows VM"
  type        = string
  sensitive   = true
}

variable "aws_subnet_id" {
  description = "AWS subnet ID where the test instance will be deployed"
  type        = string
}

variable "aws_key_name" {
  description = "AWS EC2 key pair name for SSH access"
  type        = string
}

variable "aws_security_group_ids" {
  description = "Security group IDs for the AWS Linux test instance"
  type        = list(string)
}