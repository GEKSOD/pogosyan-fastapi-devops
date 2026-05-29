variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_cidr" {
  description = "CIDR block for the Terraform-managed subnet"
  type        = string
  default     = "10.10.0.0/24"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "pogosyan-fastapi-web"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "docker_image" {
  description = "Docker Hub image for the FastAPI service"
  type        = string
  default     = "geksod/pogosyan-fastapi:latest"
}
