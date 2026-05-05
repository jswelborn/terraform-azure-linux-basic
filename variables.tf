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