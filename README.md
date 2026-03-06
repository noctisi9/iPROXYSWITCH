# 🛰️ ProxySwitch – System Proxy Management Script

A lightweight **Bash utility for enabling or disabling system-wide proxy settings on Linux systems**.

This tool modifies key configuration locations used by the operating system and package managers, allowing users to **quickly toggle proxy usage** without manually editing configuration files.

Designed for **developers, network engineers, and system administrators** who frequently operate in restricted or proxied networks.

---

# 👤 Author

**Creator & Author:**
🕶️ **Noctis Nobunga**

---

# 📌 Overview

`proxy.sh` is a **root-level network configuration script** that allows you to:

* Enable a proxy for the entire system
* Disable proxy settings instantly
* Automatically configure multiple subsystems

Instead of editing files manually, the script **centralizes proxy configuration into a single command**.

---

# ⚙️ Features

✨ **System-Wide Proxy Control**
Configures environment variables used by Linux applications.

📦 **APT Package Manager Support**
Automatically sets proxy settings for `apt` so package downloads work behind a proxy.

🐚 **Bash Environment Integration**
Updates `.bashrc` so shell sessions inherit proxy settings.

📡 **Snap Package Manager Support**
Ensures Snap packages respect the proxy configuration.

🧹 **Clean Removal**
Disabling the proxy removes all related configuration entries.

---

# 🧩 How It Works

The script modifies several key configuration points:

| Component          | Location                        | Purpose                            |
| ------------------ | ------------------------------- | ---------------------------------- |
| System Environment | `/etc/environment`              | Global proxy variables             |
| APT Proxy Config   | `/etc/apt/apt.conf.d/95proxies` | Package manager proxy              |
| User Shell         | `~/.bashrc`                     | Proxy variables for shell sessions |
| Snap               | `snap set system proxy.*`       | Snap package networking            |

---

# 📂 Script Structure

The script operates using a **command argument system**:

```
sudo ./proxy.sh on
sudo ./proxy.sh off
```

### Modes

| Mode  | Description                 |
| ----- | --------------------------- |
| `on`  | Enables proxy configuration |
| `off` | Removes proxy configuration |

---

# 🚀 Usage

## 1️⃣ Make the Script Executable

```bash
chmod +x proxy.sh
```

---

## 2️⃣ Enable Proxy

```bash
sudo ./proxy.sh on
```

You will be prompted for:

```
Proxy IP
Proxy Port
```

Example:

```
Enter Proxy IP: 192.168.1.50
Enter Proxy Port: 8080
```

The proxy will then be applied system-wide.

---

## 3️⃣ Disable Proxy

```bash
sudo ./proxy.sh off
```

This removes all proxy settings from:

* `/etc/environment`
* `.bashrc`
* `apt`
* `snap`

---

# 🔐 Requirements

* Linux distribution (Debian / Ubuntu / Linux Mint recommended)
* `sudo` or root privileges
* `snap` installed (optional but supported)

---

# 🧠 Use Cases

This script is useful for:

* School or university networks
* Corporate networks with restricted internet
* Development environments behind proxies
* Security labs
* Penetration testing environments

---

# ⚠️ Important Notes

* The script **must be executed with `sudo`**.
* Changes apply **system-wide**.
* Restarting the terminal may be required after enabling the proxy.

---

# 📜 License

Open source – free to modify and distribute.

---

# 🧭 Future Improvements

Potential upgrades:

* Proxy authentication support
* SOCKS proxy support
* GUI interface
* Automatic proxy detection
* Logging system

---

# 🛰️ Project Vision

The goal of this tool is to simplify **network configuration automation in Linux environments** while keeping the code **minimal, transparent, and efficient**.

---

⭐ If you find this useful, consider starring the repository.

---

**Created by Noctis Nobunga**

