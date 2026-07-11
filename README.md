# Corporate Active Directory & Wazuh EDR Telemetry Lab

## 📊 Project Overview
A hands-on defensive engineering lab designed to simulate a corporate enterprise network, deploy centralized Endpoint Detection and Response (EDR) telemetry, and analyze endpoint security events.

## 📐 Network Architecture & Topology
![Network Architecture Diagram](assets/Architectural Network Diagram.png)
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
