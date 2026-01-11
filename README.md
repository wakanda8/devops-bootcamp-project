# DevOps Bootcamp Final Project 2025
# Trust Me, I'm a DevOps Engineer

## 🚀 Project URLs

- **Web Application**: http://web.mosaf.dev
- **Monitoring Dashboard**: https://monitoring.mosaf.dev
- **GitHub Repository**: https://github.com/wakanda8/devops-bootcamp-project

---

## 📋 Project Overview

This project demonstrates a complete DevOps infrastructure deployment on AWS using industry-standard tools and best practices.

---

## 🏗️ 1. Infrastructure Architecture

### Network Architecture
- **VPC**: 10.0.0.0/24 (ap-southeast-1)
- **Public Subnet**: 10.0.0.0/25
  - Web Server (10.0.0.5)
- **Private Subnet**: 10.0.0.128/25
  - Ansible Controller (10.0.0.135)
  - Monitoring Server (10.0.0.136)

### Components
1. **Web Server** (Public)
   - Ubuntu 24.04
   - Docker + Application Container
   - Node Exporter (metrics)
   
2. **Ansible Controller** (Private)
   - Configuration management
   - Automation orchestration

3. **Monitoring Server** (Private)
   - Prometheus (metrics collection)
   - Grafana (visualization)
   - Cloudflare Tunnel (secure access)

---

## 🛠️ 2. Technologies Stack

| Category | Technology |
|----------|-----------|
| **Infrastructure as Code** | Terraform |
| **Configuration Management** | Ansible |
| **Containerization** | Docker |
| **Container Registry** | AWS ECR |
| **Monitoring** | Prometheus + Grafana |
| **DNS & CDN** | Cloudflare |
| **Secure Access** | Cloudflare Tunnel |
| **Cloud Provider** | AWS (Singapore - ap-southeast-1) |
| **Version Control** | Git + GitHub |

---

## 📊 3. Monitoring & Observability

### Metrics Collected
- ✅ CPU Usage
- ✅ Memory Usage
- ✅ Disk Usage
- ✅ Network Traffic
- ✅ System Load
- ✅ Uptime

### Grafana Dashboard
Access: **https://monitoring.mosaf.dev**

**Note:** Login credentials provided separately

**Dashboard Features:**
- Real-time metrics (15s refresh)
- CPU, RAM, Disk utilization
- Network traffic graphs
- System health indicators

---

## 📁 4. Repository Structure
```
devops-bootcamp-project/
├── terraform/                    # Infrastructure as Code
│   ├── provider.tf              # AWS provider & S3 backend
│   ├── variables.tf             # Variable definitions
│   ├── vpc.tf                   # VPC, subnets, gateways
│   ├── security-groups.tf       # Security group rules
│   ├── iam.tf                   # IAM roles for SSM
│   ├── ec2.tf                   # EC2 instances
│   ├── ecr.tf                   # ECR repository
│   └── outputs.tf               # Output values
│
├── ansible/                      # Configuration Management
│   ├── inventory.ini            # Server inventory
│   ├── ansible.cfg              # Ansible configuration
│   ├── playbook-install-docker.yml
│   ├── playbook-deploy-app.yml
│   ├── playbook-install-node-exporter.yml
│   └── monitoring-configs/
│       ├── prometheus.yml       # Prometheus config
│       └── docker-compose.yml   # Monitoring stack
│
├── README.md                     # This file
└── .gitignore                   # Git ignore rules
```

---

## 🚀 5. Deployment Process

### Phase 1: Infrastructure Provisioning (Terraform)
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

**Resources Created:**
- VPC with public/private subnets
- Internet Gateway & NAT Gateway
- 3 EC2 instances (t3.micro)
- Security groups
- ECR repository
- IAM roles for SSM

### Phase 2: Application Deployment (Docker + Ansible)
```bash
cd ansible
ansible-playbook playbook-install-docker.yml
ansible-playbook playbook-deploy-app.yml
ansible-playbook playbook-install-node-exporter.yml
```

**Steps:**
1. Install Docker on Web Server
2. Build and push Docker image to ECR
3. Deploy container on Web Server
4. Install Node Exporter for monitoring

### Phase 3: Monitoring Setup
```bash
# Deployed on Monitoring Server via SSM
docker compose up -d  # Prometheus + Grafana
```

**Components:**
- Prometheus: Scrapes metrics every 15s
- Grafana: Visualizes metrics with dashboards
- Node Exporter: Exports system metrics

### Phase 4: DNS Configuration (Cloudflare)
```bash
# DNS Records
web.mosaf.dev → 18.138.186.141 (A Record)
monitoring.mosaf.dev → Cloudflare Tunnel (CNAME)
```

**Cloudflare Tunnel:**
- Secures Grafana access without exposing ports
- Provides HTTPS encryption
- No public IP needed for monitoring server

---

## 🔐 6. Security Considerations

1. **Network Segmentation**
   - Private subnet for sensitive services
   - NAT Gateway for outbound-only internet access

2. **Security Groups**
   - Least privilege access
   - Port 22 restricted to VPC
   - Port 9100 only from Monitoring Server

3. **Cloudflare Tunnel**
   - No public exposure of Grafana
   - HTTPS encryption
   - Authentication required

4. **IAM Roles**
   - SSM access via IAM roles (no SSH keys on internet)
   - ECR read-only access for EC2

---

## 👨‍💻 Author

**Mohamad Safwan**  
DevOps Bootcamp 2025  
Infratify

---

## 📝 Notes

- All infrastructure in AWS region: **ap-southeast-1** (Singapore)
- Application runs on **Ubuntu 24.04 LTS**
- Monitoring data retained for 15 days (Prometheus default)

---

**Project Status**: ✅ **COMPLETED**  
**Submission Date**: January 2026
