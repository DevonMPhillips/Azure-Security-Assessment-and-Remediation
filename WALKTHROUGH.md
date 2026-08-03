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
In federal security, the "authorization boundary" dictates exactly what is and isn't your problem. For DMP Conulting, our boundary includes the Azure Resource Group (rg-dmpgov-prod) and everything inside it. If an enterprise Active Directory sits outside this Resource Group, it is out of scope for this specific assessment (treated as an inherited control).

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
## Stage 3: Security Assessment Execution
Objectives:	Execute a vulnerability assessment of the Azure environment using manual configuration reviews and native CSPM tools to identify security gaps.

#### Step 1: Manual Network Architecture Review (NSGs)
As an assessor, your first stop is often the network boundary.

Navigate to the Azure Portal and open your resource group rg-dmpgov-prod.

Select the Network Security Group: nsg-dmpgov-frontend.

Select Inbound security rules on the left menu.

The Finding: You will see two critical misconfigurations: Allow-SSH-Any (Port 22) and Allow-RDP-Any (Port 3389) are open to the entire internet (*). In an enterprise architecture, management ports should be restricted to specific VPN gateways, Azure Bastion, or dedicated management subnets—never the public internet.

<br>

<img width="1387" height="852" alt="image" src="https://github.com/user-attachments/assets/6ea02e94-d146-482d-bbcc-0ec6ec4321c5" />

<br>

#### Step 2: Evaluate Storage Account Security Posture
Data exfiltration often happens through misconfigured storage.

Go back to rg-dmpgov-prod and select your Storage Account (stdmpgov[suffix]).

Under the Settings menu on the left, select Configuration.

The Finding:

Notice that Allow Blob anonymous access is set to Enabled. This means anyone with a URL could potentially read sensitive federal data.

Notice that Secure transfer required is Disabled. This means data can be transmitted over unencrypted HTTP, violating data-in-transit protections.

<br>

<img width="955" height="862" alt="image" src="https://github.com/user-attachments/assets/99f50f86-b52d-4b87-be65-e3cf0154779a" />

<br>

#### Step 3: Assess the Key Vault
Key Vaults hold the "keys to the kingdom."

Open your Key Vault (kv-dmpgov-dmpconsulting).

Under Settings, select Networking.

The Finding: Public network access is set to Allow public access from all networks.

<br>

<img width="956" height="616" alt="image" src="https://github.com/user-attachments/assets/28ace75f-1777-45ea-92ea-999aef2f3844" />

<br>

Go to Properties on the left menu.

The Finding: Purge protection is Disabled. If an attacker compromises an account, they could permanently delete secrets, causing a severe availability impact.

<br>

<img width="952" height="612" alt="image" src="https://github.com/user-attachments/assets/f4fe5793-29ef-4335-b34a-58d77f20fd45" />

<br>

#### Step 4: Automated CSPM Scan via Microsoft Defender for Cloud
While manual review is crucial, federal assessors heavily rely on automated continuous monitoring.

In the Azure Portal search bar, type Defender for Cloud and open it.

On the left menu, select Recommendations.

Filter by your specific subscription or resource group.

The Finding: Defender will flag the resources we just reviewed. You will likely see recommendations such as "Management ports of virtual machines should be protected with just-in-time network access" or "Secure transfer to storage accounts should be enabled."

## Stage 4: Documentation & Risk Analysis
Map identified vulnerabilities to NIST SP 800-53 Rev. 5 controls, calculate risk levels, and generate a Risk Register and Security Assessment Report (SAR). The SAR and Risk Register are the primary artifacts used by the Authorizing Official to make a risk-based decision on whether to grant an ATO.

Step 1: Build the NIST 800-53 Control Mapping Matrix
Create a file named nist_control_mapping.md in your evidence/ folder. This matrix proves that you understand how specific Azure configurations tie back to federal regulations.
