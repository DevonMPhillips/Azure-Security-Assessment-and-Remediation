# Azure-Security-Assessment-and-Remediation
Azure cloud security assessment project demonstrating vulnerability management, NIST SP 800-53 control validation, POA&amp;M development, and security remediation.

## Project Objective
To design, execute, and document a complete cloud vulnerability assessment of a fictional Azure environment. This project will demonstrate a practical Assessment & Authorization (A&A) workflow by identifying security weaknesses, mapping findings to NIST SP 800-53 Rev. 5 controls, documenting risks via a Security Assessment Report (SAR) and POA&M, and validating remediations to support an Authorization to Operate (ATO).

## Scenario
DMP Consulting, a fictional federal contractor, is migrating an internal business application to Microsoft Azure. To operate securely and maintain federal compliance, the organization must align with the NIST Risk Management Framework (RMF) (NIST SP 800-37 Rev. 2) and implement security controls from NIST SP 800-53 Rev. 5. I am the Lead Security Specialist assigned to independently assess the environment, document security gaps, and guide the engineering team through remediation before the system can receive its initial ATO

## Assessment Workflow
- **Preparation**: Deploy the intentionally vulnerable Azure infrastructure (using Terraform/CLI for reproducibility).

- **Discovery & Planning**: Catalog all assets and define the boundaries and methods of the assessment.

- **Execution**: Perform configuration reviews and vulnerability assessments using Microsoft-native security tools.

- **Analysis & Documentation**: Translate technical findings into business risks, map them to NIST controls, and generate the SAR, Risk Register, and POA&M.

- **Remediation**: Implement corrective actions for the identified vulnerabilities.

- **Validation & Closure**: Re-assess the environment to prove the remediations were successful and establish a continuous monitoring strategy.

## Azure Services & Security Tools Used

## Project Roadmap (Major Phases)

| Stage | Focus Area | Key Deliverables |
|-------|------------|------------------|
| **Stage 1** | Environment Preparation | Infrastructure as Code (IaC) deployment of the vulnerable Azure environment, Architecture Diagram, Asset Inventory |
| **Stage 2** | Assessment Planning | Security Assessment Plan, Rules of Engagement (RoE) |
| **Stage 3** | Security Assessment Execution | Microsoft Defender for Cloud assessment, Azure Policy compliance scan, manual security configuration review, evidence collection |
| **Stage 4** | Documentation & Risk Analysis | Security Assessment Report (SAR), Risk Register, NIST SP 800-53 Control Mapping Matrix |
| **Stage 5** | Action Planning (POA&M) | Plan of Action & Milestones (POA&M), Remediation Tracking Log |
| **Stage 6** | Remediation Implementation | Remediation of identified security findings (NSGs, Storage Accounts, Key Vault, RBAC, Azure Policy, etc.) with documented implementation steps |
| **Stage 7** | Validation & Reassessment | Post-remediation validation scans, security control verification, updated POA&M, closure of resolved findings |
| **Stage 8** | Final Reporting & Continuous Monitoring | Executive Summary, Lessons Learned, Continuous Monitoring Strategy, Final Security Assessment Package |


