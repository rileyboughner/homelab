# Homelab Network Segmentation Plan

## Overview

This document defines the network architecture, trust levels, IP scheme, DHCP strategy, and firewall rules for the homelab environment.

---

# 1. Network Trust Model

## Subnets

### 192.168.1.0/24 — Trusted Network (High Trust)

**Purpose:** Servers and infrastructure

* Reverse proxy
* Frigate
* Jellyfin
* Vaultwarden
* *arr stack
* MQTT broker
* Future infrastructure services

**Rules:**

* WAN access: ✅ Allowed
* Can access Cameras (192.168.3.0/24): ✅ Allowed
* Can access Personal (192.168.2.0/24): ❌ Blocked (unless explicitly needed)
* Can access Guest (192.168.255.0/24): ❌ Blocked

---

### 192.168.2.0/24 — Personal Devices (Medium Trust)

**Purpose:** Daily-use devices

* Laptops
* Phones
* Tablets
* Gaming systems
* TVs

**Rules:**

* WAN access: ✅ Allowed
* Intra-subnet communication: ✅ Allowed
* Access to Trusted (1.x): ❌ Blocked
* Access to Cameras (3.x): ❌ Blocked
* Access to Guest (255.x): ❌ Blocked

All services accessed via public domain (hairpin NAT).

---

### 192.168.3.0/24 — Cameras / IoT (Low Trust)

**Purpose:** Isolated surveillance network

* IP Cameras

**Rules:**

* WAN access: ❌ Blocked
* Cannot initiate connections to any subnet
* Trusted (1.x) can access Cameras: ✅ Allowed
* No lateral movement

Optional hardening:

* Disable DNS
* Disable NTP
* No default gateway

---

### 192.168.255.0/24 — Guest Network (Untrusted)

**Purpose:** Visitors and temporary devices

**Rules:**

* WAN access: ✅ Allowed
* All LAN access: ❌ Blocked
* Client isolation: ✅ Enabled

---

# 2. IP Addressing Strategy

All subnets use /24 (255.255.255.0).

## Standard Layout per Subnet

* .1 → Router
* .2 – .49 → Infrastructure / Reserved
* .50 – .99 → DHCP Reservations
* .100 – .199 → Dynamic DHCP pool
* .200 – .254 → Reserved for future expansion

---

# 3. DHCP Configuration

For each subnet:

* DHCP Start: 100
* DHCP Limit: 100
* Dynamic Range: .100 – .199

Static addressing handled via:

* DHCP Static Leases (MAC → IP binding)

Do NOT configure static IPs manually on devices.

---

# 4. Firewall Zone Rules

## Trusted (1.x)

* Input: Accept
* Output: Accept
* Forward: Reject
* Forward to WAN: Yes
* Forward to Cameras: Yes

## Personal (2.x)

* Input: Accept
* Output: Accept
* Forward: Accept (intra-zone only)
* Forward to WAN: Yes
* Forward to other LAN zones: No

## Cameras (3.x)

* Input: Reject
* Output: Accept
* Forward: Reject
* Forward to WAN: No
* Allow Trusted → Cameras rule

## Guest (255.x)

* Input: Reject
* Output: Accept
* Forward: Reject
* Forward to WAN: Yes
* Client isolation: Enabled

---

# 5. WAN Blocking for Specific Devices

Devices such as printers or smart TVs can be blocked from WAN access by:

* Creating firewall rule:

  * Source IP → WAN
  * Action: Reject

Alternative:

* Place device in Cameras (3.x) subnet for automatic WAN isolation.

---

# 6. Service Access Model

All services are accessed via:

* Public domain
* Reverse proxy
* TLS

Internal subnets do not directly communicate.

Hairpin NAT enabled on router for internal access via public domain.

---

# 7. Security Goals

* Prevent lateral movement
* Protect servers from compromised clients
* Block IoT internet access
* Fully isolate guest devices
* Centralize control through firewall

---

# 8. Future Improvements

* VLAN tagging with managed switch
* Separate DMZ for public-facing services
* WireGuard VPN for secure remote access
* Central logging
* IDS/IPS integration

---

# 9. Naming Convention

A consistent naming convention improves clarity, troubleshooting, and future scalability.

## General Format

`<type>-<role/location>-<number>`

Examples:

* `srv-frigate-01`
* `srv-jellyfin-01`
* `cam-frontdoor-01`
* `pc-riley-main`
* `ap-livingroom-01`

---

## Device Type Prefixes

### Servers (192.168.1.x)

* `srv-` → Application or infrastructure servers
* `nas-` → Storage devices
* `proxy-` → Reverse proxy

Examples:

* `srv-frigate-01`
* `srv-vaultwarden-01`
* `nas-main-01`

---

### Personal Devices (192.168.2.x)

* `pc-` → Desktop
* `laptop-` → Laptop
* `phone-` → Phone
* `tv-` → Television
* `tablet-` → Tablet

Examples:

* `pc-riley-main`
* `laptop-riley-work`
* `tv-livingroom`

---

### Cameras / IoT (192.168.3.x)

* `cam-` → Camera
* `iot-` → Other IoT devices

Examples:

* `cam-frontdoor-01`
* `cam-driveway-01`
* `cam-backyard-01`

---

### Network Infrastructure

* `ap-` → Access point
* `sw-` → Switch
* `rtr-` → Router

Examples:

* `rtr-core-01`
* `ap-livingroom-01`

---

## Numbering Rules

* Use `-01`, `-02`, etc., when multiple devices serve the same role.
* Leave numbering off personal devices unless needed.
* Keep names lowercase and hyphen-separated.
* Avoid spaces and special characters.

---

# Status Checklist

* [ ] Create subnets
* [ ] Configure DHCP ranges
* [ ] Create firewall zones
* [ ] Add forwarding rules
* [ ] Block WAN for cameras
* [ ] Block WAN for selected devices
* [ ] Enable guest isolation
* [ ] Verify hairpin NAT
* [ ] Test segmentation

---

End of Document
