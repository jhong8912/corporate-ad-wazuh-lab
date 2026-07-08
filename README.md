# Corporate Active Directory & Wazuh EDR Telemetry Lab

## 📊 Project Overview
A hands-on defensive engineering lab designed to simulate a corporate enterprise network, deploy centralized Endpoint Detection and Response (EDR) telemetry, and analyze endpoint security events.

## 📐 Network Architecture & Topology
*To be inserted: Network Diagram (Local Host -> Isolated NAT Subnet)*
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
