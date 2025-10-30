# 🩸 BloodRitual Setup

> *An automated Arch Linux rice installation script for the terminally online*

A comprehensive dotfiles deployment and package installation script that transforms a fresh Arch Linux installation into a fully configured, aesthetically pleasing development environment.

## 🎯 What This Does

BloodRitual automates the installation of:
- **Terminal Emulators**: Alacritty, Kitty, Ghostty
- **Window Managers**: Hyprland, Niri (+ Hyprland ecosystem tools)
- **Ricing Tools**: Waybar, EWW, SWWW
- **Editors**: Neovim, Helix
- **Browsers**: Brave, Zen, Firefox variants, Chromium, Vivaldi
- **Security Tools**: Burp Suite, SQLMap, Wireshark, Tor, Proxychains
- **System Monitors**: Btop, Gotop, Nvtop, Fastfetch, Cava
- **Development Tools**: Docker, DBeaver, Arduino IDE, VirtualBox
- **Media Players**: VLC, MPV, MPC
- **And much more...**

Plus, it clones and deploys your personal dotfiles from the repository.

## ⚡ Prerequisites

### Required
- **Arch Linux** (or Arch-based distro)
- **AUR Helper**: `yay` or `paru`
- **Git**: For cloning repositories
- **Internet Connection**: For downloading packages

### Before Running
```bash
# Install an AUR helper if you don't have one
# For paru:
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# For yay:
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## 🚀 Installation

### Quick Start
```bash
# Download the script
curl -O https://raw.githubusercontent.com/c45p14n/BloodRitual/main/BloodRitual.sh

# Make it executable
chmod +x BloodRitual.sh

# Run the ritual
./BloodRitual.sh
```

### What Happens
1. **Banner Display**: Shows the Caspian ASCII art
2. **Dependency Check**: Verifies Git and AUR helper are installed
3. **Package Installation**: Installs all packages from the list
4. **Repository Clone**: Clones dotfiles from GitHub
5. **File Deployment**: Copies config files to `~/.config/`
6. **Cleanup**: Removes temporary files (unless `KEEP_REPO=true`)

## 📁 Deployed Configurations

The script deploys the following dotfiles:

| Source | Destination |
|--------|-------------|
| `Caspian-Shell` | `~/.config/caspian-shell` |
| `alacritty` | `~/.config/alacritty` |
| `btop` | `~/.config/btop` |
| `cava` | `~/.config/cava` |
| `eww` | `~/.config/eww` |
| `fastfetch` | `~/.config/fastfetch` |
| `helix` | `~/.config/helix` |
| `hypr` | `~/.config/hypr` |
| `kitty` | `~/.config/kitty` |
| `mpd` | `~/.config/mpd` |
| `mpv` | `~/.config/mpv` |
| `niri` | `~/.config/niri` |
| `nvim` | `~/.config/nvim` |
| `rofi` | `~/.config/rofi` |
| `shellcnfgs` | `~/shellcnfgs` |

## ⚙️ Configuration

### Modify Package List
Edit the `PACKAGES` array in the script:
```bash
readonly PACKAGES=(
    "your-package-here"
    "another-package"
)
```

### Change Repository
Update the repository URL:
```bash
readonly REPO_URL="https://github.com/your-username/your-dotfiles.git"
```

### Keep Cloned Repository
Set this to preserve the repo after installation:
```bash
readonly KEEP_REPO=true  # Default: false
```

### Modify File Mappings
Add or remove config file destinations:
```bash
declare -A FILE_MAPPINGS=(
    ["source-dir"]="$HOME/.config/destination"
)
```

## 🛡️ Safety Features

- **Automatic Backups**: Existing configs are backed up with timestamps
- **Cleanup on Exit**: Temporary files are removed automatically
- **Error Handling**: Script exits on errors with clear messages
- **Skip Installed**: Won't reinstall already-installed packages
- **Logging**: Color-coded output for info, success, warnings, and errors

## 📝 Customization Tips

### For Personal Use
1. Fork the BloodRitual repository
2. Modify the `REPO_URL` to point to your fork
3. Customize `PACKAGES` and `FILE_MAPPINGS`
4. Add your own dotfiles to the repository

### Add New Configs
```bash
# In FILE_MAPPINGS section, add:
["your-config-dir"]="$HOME/.config/your-config-dir"
```

## 🎨 Post-Installation

After running the script:

1. **Reboot** or re-login to apply changes
2. **Launch Hyprland** (if using as WM)
3. **Check logs** at `~/.local/share/hypr/` for any issues
4. **Customize further** - edit config files in `~/.config/`

## 📜 License

This script is provided as-is. Use at your own risk. Always review scripts before running them on your system.

## 🤝 Contributing

Found a bug or want to add features? 
- Open an issue on GitHub
- Submit a pull request
- Fork and customize for your needs

## 💀 Disclaimer

This script makes significant changes to your system. It's recommended to:
- Run on a fresh installation
- Review the package list before executing
- Have backups of important data
- Understand what each package does

---

**Made with ☕ and sleep deprivation**

*May your ricing journey be glorious and your configs forever portable.*
