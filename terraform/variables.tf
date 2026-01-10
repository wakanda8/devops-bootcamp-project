variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.0.0/25"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.0.128/25"
}

variable "web_server_private_ip" {
  description = "Private IP for web server"
  type        = string
  default     = "10.0.0.5"
}

variable "ansible_server_private_ip" {
  description = "Private IP for Ansible controller"
  type        = string
  default     = "10.0.0.135"
}

variable "monitoring_server_private_ip" {
  description = "Private IP for monitoring server"
  type        = string
  default     = "10.0.0.136"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Your name for the project"
  type        = string
  default     = "safwan"
}
