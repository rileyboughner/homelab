# Homelab Overview
This repo documents my modular server architecture (Docker Compose based) and future plans. It is intended for Linux servers and designed to build on top of my dotfiles-based server configuration.

---

## 📁 File Structure
| Path | Purpose |
| --- | --- |
| `/mnt/tank` | Bulk storage location. |
| `/srv/containers` | Docker Compose files and container configuration directories. |
| `/srv/data/{user}` | User data mounted via SSHFS to clients (e.g., Documents shared across laptop/desktop). |
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
- [ ] Vaultwarden
- [ ] AI
- [ ] Code repo
- [ ] Container repo
- [ ] Websites
- [ ] OpenTime
- [ ] Email

---

![Project Screenshot](images/screenshot.png)
