# Corporate Active Directory & Wazuh EDR Telemetry Lab

## 📊 Project Overview
A hands-on defensive engineering lab designed to simulate a corporate enterprise network, deploy centralized Endpoint Detection and Response (EDR) telemetry, and analyze endpoint security events.

## 📐 Network Architecture & Topology
[Network Architecture Diagram](assets/Architectural Network Diagram.png)
* **Domain Controller (DC-01):** Windows Server 2022 | `10.0.2.10`
* **Workstation (WKSTN-01):** Windows 10/11 Enterprise | `10.0.2.15`
* **EDR Manager (WAZUH-01):** Ubuntu Server 22.04 LTS | `10.0.2.20`

## 🛡️ Core Capabilities Demonstrated
* Enterprise Identity & Access Management (AD DS)
* Endpoint Detection & Response (EDR) Fleet Management
* Log Telemetry Aggregation & Parsing (Sysmon -> Wazuh)
* Security Policy Hardening (Group Policy Objects)

---

## 📅 Engineering & Progress Logs
### 🔹 [Week 1 Progress: Environment & Provisioning]
* **Milestones (July 4-5):** Initialized public-facing documentation repository framework. Provisioned VirtualBox infrastructure and engineered an isolated virtual network (`CorpNet` - `10.0.2.0/24`) with DHCP explicitly disabled to enforce strict static engineering. Initiated downloads for enterprise OS evaluation images.
* **Milestones (July 6):** Architected raw system hardware specifications for the primary domain host (`DC-01`) and enterprise workstation endpoint (`WKSTN-01`). Provisioned distinct runtime environments (2 vCPUs, 2GB RAM baseline per machine) and modified networking layers, bridging both virtual interfaces directly into the isolated `CorpNet` NAT Network plane.
* **Milestones (July 7):** Initialized virtual environments for `DC-01` and `WKSTN-01`. Executed base-image OS clean installations utilizing Windows Server 2022 (Desktop Experience) and Windows Enterprise platforms. Provisioned VirtualBox Guest Additions across both host layers to establish kernel utility drivers and display parity.
* **Milestones (July 8):** Provisioned the central security monitoring host profile (`WAZUH-01`) utilizing an Ubuntu Server LTS framework. Allocated specialized system baselines (2 vCPUs, 4GB RAM) optimized for EDR indexing workloads and mapped its physical adapter matrix natively into the isolated `CorpNet` network layer.,
* **Milestones (July 9):** Engineered a hardcoded static IPv4 routing matrix across all active network nodes (`10.0.2.10`, `10.0.2.15`, `10.0.2.20`). Reconfigured the Linux network interface sub-system utilizing Netplan configuration mapping. Implemented granular host-based firewall overrides to permit ICMPv4 telemetry traffic, validating flawless inter-subnet communication and verification mesh connectivity.
  
### 🔹 [Week 2 Progress: Directory Engineering & Automation]
* **Milestones (July 11-12)**: Installed Active Directory Domain Services (AD DS) and DNS features onto `DC-01`. Successfully promoted the host server to Domain Controller status for the `corp.local` enterprise root forest.
* **Milestones (July 13)**: Hardcoded local network interfaces on `WKSTN-01` to direct DNS lookups to the primary Domain Controller. Executed a clean administrative domain join, verifying successful registration of the workstation endpoint within Active Directory.
* **Milestones (July 14-15)**: Designed an Organizational Unit (OU) structure mirroring corporate business divisions (`IT`, `HR`, `Finance`). Wrote a custom Python automation script to generate 20 structurally valid corporate identities mapped directly to their respective OUs.
* **Milestones (July 16-17)**: Engineered and executed an administrative PowerShell automation script using the ActiveDirectory module. Processed the local CSV data-stream, parsed respective department fields, dynamically targeted corresponding LDAP container paths, and safely provisioned all 20 domain identities with secure starting parameters. Verified policy configurations by executing a domain-authenticated initial sign-on and enforced credential-rotation workflows from `WKSTN-01`.
* **Technical Takeaway**: Leveraged programmatic scaling over manual UI interaction. By using dynamic string interpolation (`"OU=$dept,$parentOU"`), the script automatically adapted destination endpoints relative to target user rows, eliminating configuration drifting.
* **Milestones (July 14-15)**: Designed an Organizational Unit (OU) structure mirroring corporate business divisions (`IT`, `HR`, `Finance`). Wrote a custom Python automation script to generate 20 structurally valid corporate identities mapped directly to their respective OUs, exporting data clean-parsed to a deployment CSV file.

* ### 🔹 [Week 3 Progress: Defensive Engineering & EDR Deployment]
* **Milestones (July 18-19):** Provisioned central Wazuh EDR/SIEM manager instance (`10.0.2.20`) on Ubuntu Server LTS. Resolved Java Heap memory limits and Linux kernel virtual memory space limits (`vm.max_map_count`) to ensure indexer stability.
* **Milestones (July 20):** Enrolled 64-bit Wazuh agents across all target Windows endpoints (`DC-01` and `WKSTN-01`), validating dual live telemetry streams in the central operations dashboard.
* **Milestones (July 21):** Deployed Microsoft Sysinternals Sysmon across all domain assets. Integrated SwiftOnSecurity XML rule profiles to capture Event ID 1 (Process Creation) and Event ID 3 (Network Connection) log streams.
* **Milestones (July 22):** Modified agent configuration profiles (`ossec.conf`) on `DC-01` and `WKSTN-01` to dynamically ingest the `Microsoft-Windows-Sysmon/Operational` event channel. Validated end-to-end log forwarding by querying live Event ID 1 (Process Creation) telemetry streams inside the centralized Wazuh SIEM dashboard.
