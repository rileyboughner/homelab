# Homelab Overview
This repo documents my modular server architecture (Docker Compose based) and future plans. It can be used on any server with docker compose installed however using the provided nisox configuration is highly encouraged.

---

## 📁 File Structure 
| Path | Purpose |
| --- | --- |
| `/mnt/tank` | Bulk storage location. |
| `/srv/containers` | Docker Compose files and container configuration directories. |
| `/srv/data/{user}` | User data mounted via SSHFS to clients (e.g., Documents shared across laptop/desktop). |
| `/srv/websites` | Websites and related content. |

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

## 🧰 Services
- [x] File syncing
- [x] Home Assistant
- [x] Immich
- [x] Frigate
- [x] Proxy
- [x] Arr stack
- [ ] Vaultwarden
- [ ] wireguard
- [ ] AI
- [ ] Websites
- [ ] OpenTime
- [ ] Email
- [ ] Code repo
- [ ] Container repo

---

##  TODO
- [ ] complete install script
    - [ ] figure out env vars
    - [ ] figure out setting symlinks
- [ ] create port map
- [ ] standardize docker compose files
- [ ] complete test of configuraion.nix
- [ ] create robust system for backups
- [ ] create status monitor script
- [ ] create global env var for config
- [ ] rethink naming conventions for "TANK_ROOT"

---
