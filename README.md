## Project Structure
```txt
vpn-terraform/
│── modules/
│   ├── aws_vpn/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── azure_vpn/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── gcp_vpn/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   ├── stage/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   ├── prod/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│── terraform.tfvars
│── providers.tf
│── versions.tf
│── README.md
```

---
## Step 1: Install Required Tools

Before running Terraform, ensure you have:
- Terraform CLI (Download)
- AWS CLI (Download)
- Azure CLI (Download)
- Google Cloud SDK (Download)

## Step 2. Authenticate with Cloud Providers

### For AWS
```bash
aws configure
```

- Enter your AWS Access Key, Secret Key, region, and output format.

### For Azure
```bash
az login
```

- If using a service principal:
```bash
az login --service-principal -u <APP_ID> -p <PASSWORD> --tenant <TENANT_ID>
```

### For Google Cloud
```bash
gcloud auth login
gcloud config set project <YOUR_PROJECT_ID>
```

## 3. Initialize Terraform

- Navigate to the appropriate environment (e.g., dev):
```bash
cd environments/dev
terraform init
```

## Step 4. Validate Configuration

- Check for any syntax errors:
```bash
terraform validate
```

## Step 5: Plan and Apply Terraform

- Plan Deployment
```bash
terraform plan
```
This shows what changes will be made.

- Apply Deployment
```bash
terraform apply -auto-approve
```

- This will provision VPN gateways and tunnels.

## Spte 6: Verify VPN Setup

### On AWS

- Check if VPN Gateway is created:
```bash
aws ec2 describe-vpn-gateways
```
- Check VPN Connection:
```bash
aws ec2 describe-vpn-connections
```

### On Azure

- Check VPN Gateway:
```bash
az network vnet-gateway list --resource-group <RESOURCE_GROUP>
```

### On Google Cloud

- Check VPN Gateway:
```bash
gcloud compute vpn-gateways list
```

## Step 7: Troubleshooting

#### Issue: Missing Provider Credentials
- Ensure the credentials for AWS, Azure, or Google Cloud are correctly configured.
- Run:
```bash
aws sts get-caller-identity
az account show
gcloud auth list
```


#### Issue: Terraform Errors (e.g., missing variables)
- Ensure the terraform.tfvars file is correctly set up.
- Run:
```bash
terraform plan -var-file=terraform.tfvars
```


#### Issue: VPN Not Connecting
- Check firewall rules and security groups.
- Ensure correct VPN peer IPs and shared secrets.

## Step 8: Destroy Infrastructure (Clean Up)

- If you want to remove the setup:
```bash
terraform destroy -auto-approve
```

This should get your AWS, Azure, and Google Cloud VPN setup fully working with Terraform modules and environments. 