<img width="1200" height="300" alt="WTF Homelab(1)" src="https://github.com/user-attachments/assets/2268c437-7e36-4ed9-8cbe-4311e699d16a" />


<div align="center">
  <img src="https://img.shields.io/badge/Servarr-e66001?style=for-the-badge&logo=BitTorrent&logoColor=white" alt="Servarr" />
  <img src="https://img.shields.io/badge/home%20assistant-%2341BDF5.svg?style=for-the-badge&logo=home-assistant&logoColor=white" alt="Home Assistant" />
  <img src="https://img.shields.io/badge/vaultwarden-%23175DDC.svg?style=for-the-badge&logo=bitwarden&logoColor=white" alt="Vaultwarden" />
  <img src="https://img.shields.io/badge/file%20server-18c249?style=for-the-badge&logo=Files&logoColor=white" alt="File Server" />
  <img src="https://img.shields.io/badge/immich-ed79b5?style=for-the-badge&logo=immich&logoColor=white" alt="Immich" />
  <img src="https://img.shields.io/badge/Jellyfin-9a5ec0?style=for-the-badge&logo=jellyfin&logoColor=white" alt="Jellyfin" />
  <img src="https://img.shields.io/badge/frigate-%23000000.svg?style=for-the-badge&logo=frigate&logoColor=white" alt="Frigate" />
</div>

## Overview
### What the fuck is a homelab?
### Features
- Containers
- Virtual Machines

---
## 🚀 Getting Started
1. Create a fresh install of [nixos](https://nixos.org/download/)
2. Clone the Repo
```bash
git clone https://github.com/rileyboughner/homelab.git
```
3. Run the install script
```bash
cd homelab
sudo chmod +x install.sh
./install.sh
```
4. Reboot


---


## 📁 File Structure 
| Path | Purpose |
| --- | --- |
| `/mnt/tank` | Bulk storage location. |
| `/mnt/tank/config` | Defaut location of Container config files and databases. |
| `/srv/containers` | Docker Compose files |
| `/srv/files/{user}` | User data mounted via SSHFS to clients (e.g., Documents shared across laptop/desktop). |
| `/srv/websites` | Websites and related content. |

---

## 🔒 Backups
**Status:** Work in progress.

---

## ✅ Dependencies
### Current
- **Docker Compose** (required)

### Planned
- **Podman** (planned migration)
- **VM support** (planned for spinning up virtual machines)

---

## 🧰 Services
- [x] File syncing
- [x] Immich
- [x] Home Assistant
- [x] Frigate
- [x] Arr stack
- [x] Proxy
- [ ] wireguard
- [ ] Vaultwarden
- [ ] AI
- [ ] Code repo
- [ ] Container repo
- [ ] Websites
- [ ] OpenTime
- [ ] Email

---

![Project Screenshot](.images/screenshot.png)
