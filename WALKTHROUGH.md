## Stage 1: Environment Preparation & Asset Discovery
In Stage 1, we will deploy the "DMP Consulting" cloud environment. To simulate a real-world scenario where the engineering team missed a few security baselines, we will intentionally inject misconfigurations.

| Category | Details |
|----------|---------|
| **Objectives** | Deploy a vulnerable Azure environment, establish the GitHub repository, and create a baseline asset inventory. |
| **Skills Learned** | Cloud resource provisioning, Infrastructure as Code (IaC) fundamentals, system boundary definition, asset inventory creation, and Azure resource organization. |
| **Business Justification** | Accurate asset identification is a foundational requirement for Assessment & Authorization (A&A). Systems and resources that are not identified cannot be properly assessed, monitored, or secured, increasing organizational risk. |
| **Azure Services** | Resource Groups, Virtual Network (VNet), Network Security Groups (NSGs), Storage Accounts, Azure Key Vault. |
| **NIST SP 800-53 Controls** | **PM-5** – System Inventory<br>**PL-8** – Security and Privacy Architectures |

### Step-by-Step Implementation Guide

#### Step 1: Construct the Portfolio Repository
Create a new public repository on GitHub named azure-rmf-security-assessment. Clone it to your local machine and create the following exact folder structure to mimic a professional compliance engagement:

- docs/
- reports/
- evidence/
- screenshots/
- scripts/
- remediation/

#### Step 2: Deploy the Vulnerable Environment (Azure CLI)
We will use an Azure CLI script to deploy the resources. This demonstrates automated provisioning while keeping costs practically at zero.

Save the following code as deploy_vuln_env.sh inside your scripts/ folder, modify the SUFFIX variable to something unique, and run it in the Azure Cloud Shell (Bash environment) or your local terminal.

#### Step 3: Draft the Asset Inventory
Create a file named asset_inventory.md inside your docs/ folder. This fulfills NIST control PM-5. Use this Markdown table to document what we just built:

#### Verify Deployment: 
Log into the Azure Portal. Navigate to Resource Groups and open rg-securegov-prod. Ensure all four resources (VNet, NSG, Storage, Key Vault) are present.
