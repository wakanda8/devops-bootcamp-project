# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

# EC2 Instance Outputs
output "web_server_id" {
  description = "ID of the web server"
  value       = aws_instance.web_server.id
}

output "web_server_private_ip" {
  description = "Private IP of web server"
  value       = aws_instance.web_server.private_ip
}

output "web_server_public_ip" {
  description = "Public IP (Elastic IP) of web server"
  value       = aws_eip.web_server_eip.public_ip
}

output "ansible_controller_id" {
  description = "ID of the Ansible controller"
  value       = aws_instance.ansible_controller.id
}

output "ansible_controller_private_ip" {
  description = "Private IP of Ansible controller"
  value       = aws_instance.ansible_controller.private_ip
}

output "monitoring_server_id" {
  description = "ID of the monitoring server"
  value       = aws_instance.monitoring_server.id
}

output "monitoring_server_private_ip" {
  description = "Private IP of monitoring server"
  value       = aws_instance.monitoring_server.private_ip
}

# ECR Output
output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.app_repo.repository_url
}

# Security Group Outputs
output "public_security_group_id" {
  description = "ID of public security group"
  value       = aws_security_group.public.id
}

output "private_security_group_id" {
  description = "ID of private security group"
  value       = aws_security_group.private.id
}

# Connection Instructions
output "connection_instructions" {
  description = "How to connect to the instances"
  value       = <<-EOT
  
  ========================================
  CONNECTION INSTRUCTIONS
  ========================================
  
  Web Server Public IP: ${aws_eip.web_server_eip.public_ip}
  
  Connect via SSM:
    aws ssm start-session --target ${aws_instance.web_server.id} --region ap-southeast-1
    aws ssm start-session --target ${aws_instance.ansible_controller.id} --region ap-southeast-1
    aws ssm start-session --target ${aws_instance.monitoring_server.id} --region ap-southeast-1
  
  ECR Repository: ${aws_ecr_repository.app_repo.repository_url}
  
  ========================================
  EOT
}
