## Stage 1: Environment Preparation & Asset Discovery
In Stage 1, we will deploy the "DMP Consulting" cloud environment. To simulate a real-world scenario where the engineering team missed a few security baselines, we will intentionally inject misconfigurations.

| Category | Details |
|----------|---------|
| **Objectives** | Deploy a vulnerable Azure environment, establish the GitHub repository, and create a baseline asset inventory. |
| **Skills Learned** | Cloud resource provisioning, Infrastructure as Code (IaC) fundamentals, system boundary definition, asset inventory creation, and Azure resource organization. |
| **Business Justification** | Accurate asset identification is a foundational requirement for Assessment & Authorization (A&A). Systems and resources that are not identified cannot be properly assessed, monitored, or secured, increasing organizational risk. |
| **Azure Services** | Resource Groups, Virtual Network (VNet), Network Security Groups (NSGs), Storage Accounts, Azure Key Vault. |
| **NIST SP 800-53 Controls** | **PM-5** – System Inventory<br>**PL-8** – Security and Privacy Architectures |

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
Log into the Azure Portal. Navigate to Resource Groups and open rg-dmpgov-prod. Ensure all four resources (VNet, NSG, Storage, Key Vault) are present.

## Stage 2: Assessment Planning & Scoping
Objectives: Define the system boundary, establish Rules of Engagement (RoE), and draft the Security Assessment Plan (SAP).

Step 1: Define the System Boundary
In federal security, the "authorization boundary" dictates exactly what is and isn't your problem. For SecureGov Solutions, our boundary includes the Azure Resource Group (rg-securegov-prod) and everything inside it. If an enterprise Active Directory sits outside this Resource Group, it is out of scope for this specific assessment (treated as an inherited control).

Step 2: Draft the Security Assessment Plan (SAP)
Create a file named assessment_plan.md in your docs/ folder. This document outlines how you will conduct the assessment. Copy and paste the following baseline into the file:

```
# Security Assessment Plan (SAP)
**System Name:** SecureGov Internal Business App
**Assessor:** [Your Name/Title]
**Date:** [Current Date]

## 1. Assessment Scope
This assessment covers the Azure infrastructure components deployed within the `rg-securegov-prod` resource group. 
- **In-Scope:** Virtual Network, Network Security Group, Storage Account, Key Vault.
- **Out-of-Scope:** Underlying Azure hypervisor infrastructure (Microsoft's responsibility), on-premises networks.

## 2. Assessment Methodology
The assessment will follow NIST SP 800-53 Rev. 5 guidelines and utilize the following methods:
- **Examine:** Reviewing Azure configurations, IAM roles, and diagnostic settings.
- **Interview:** (Simulated) Discussions with cloud engineers regarding business justifications for open ports.
- **Test:** Utilizing Microsoft Defender for Cloud and Azure Policy to validate compliance states.

## 3. Threat Profile
The system is evaluated against threats targeting cloud control planes, including unauthorized data exposure, lateral movement via overly permissive network rules, and unauthorized access to secrets.
```

### Step 3: Establish the Rules of Engagement (RoE)
Create a file named rules_of_engagement.md in your docs/ folder. The RoE defines what you are allowed to do.

```
# Rules of Engagement (RoE)
**Target Environment:** `rg-dmpgov-prod` (Azure East US)

## 1. Authorized Activities
- Read-only configuration review via Azure Portal and CLI.
- Execution of passive compliance scans via Microsoft Defender for Cloud.
- Review of Azure Activity Logs.

## 2. Prohibited Activities
- NO Denial of Service (DoS) testing.
- NO creation, deletion, or modification of resources during the assessment phase.
- NO automated vulnerability scanning against production endpoints without prior written approval.
- NO extraction of sensitive data (PII/PHI) from the Storage Account.

## 3. Incident Response
If a critical vulnerability is discovered that poses an immediate threat to the organization, the assessor will halt activities and immediately notify the System Owner and Incident Response team.
```
