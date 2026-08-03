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