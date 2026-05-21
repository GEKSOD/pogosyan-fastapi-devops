variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "sharay-fastapi-web"
}

variable "image_id" {
  description = "Ubuntu image ID"
  type        = string
  default     = "fd8kdq6d0p8sij7h5qe3"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "docker_image" {
  description = "Docker Hub image for the FastAPI service"
  type        = string
  default     = "your-dockerhub-username/sharay-fastapi:latest"
}
