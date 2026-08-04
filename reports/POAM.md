cd# Plan of Action and Milestones (POA&M)
**System Name:** DMP COnsulting Internal Business App
**Date:** 07/20/2026

| POA&M ID | Weakness Description | Risk Level | Scheduled Completion | Milestones | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **POAM-001** | (VULN-001) NSG allows inbound TCP/22 and TCP/3389 from the public internet. | CRITICAL | [Date + 7 Days] | 1. Delete `Allow-SSH-Any` rule.<br>2. Delete `Allow-RDP-Any` rule.<br>3. Verify traffic is dropped from external sources. | Open |
| **POAM-002** | (VULN-002) Storage account allows anonymous public read access for blobs. | HIGH | [Date + 14 Days] | 1. Navigate to Storage Account Configuration.<br>2. Set "Allow Blob public access" to Disabled.<br>3. Save configuration. | Open |
| **POAM-003** | (VULN-003) Storage account does not require secure transfer (HTTPS). | MODERATE | [Date + 30 Days] | 1. Navigate to Storage Account Configuration.<br>2. Set "Secure transfer required" to Enabled.<br>3. Save configuration. | Open |
| **POAM-004** | (VULN-004) Key Vault exposed to public networks and lacks purge protection. | HIGH | [Date + 14 Days] | 1. Enable Purge Protection in Key Vault Properties.<br>2. Disable public network access.<br>3. Configure Private Endpoint (Future Phase). | Open |