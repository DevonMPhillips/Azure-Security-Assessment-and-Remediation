# Security Assessment Plan (SAP)
**System Name:** DMP consulting Internal Business App
**Assessor:** Devon Phillips
**Date:** 7/01/2026

## 1. Assessment Scope
This assessment covers the Azure infrastructure components deployed within the `rg-dmpgov-prod` resource group. 
- **In-Scope:** Virtual Network, Network Security Group, Storage Account, Key Vault.
- **Out-of-Scope:** Underlying Azure hypervisor infrastructure (Microsoft's responsibility), on-premises networks.

## 2. Assessment Methodology
The assessment will follow NIST SP 800-53 Rev. 5 guidelines and utilize the following methods:
- **Examine:** Reviewing Azure configurations, IAM roles, and diagnostic settings.
- **Interview:** (Simulated) Discussions with cloud engineers regarding business justifications for open ports.
- **Test:** Utilizing Microsoft Defender for Cloud and Azure Policy to validate compliance states.

## 3. Threat Profile
The system is evaluated against threats targeting cloud control planes, including unauthorized data exposure, lateral movement via overly permissive network rules, and unauthorized access to secrets.