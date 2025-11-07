#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                                                           ║
# ║     ▄████▄   ▄▄▄        ██████  ██▓███   ██▓ ▄▄▄       ███▄    █          ║
# ║    ▒██▀ ▀█  ▒████▄    ▒██    ▒ ▓██░  ██▒▓██▒▒████▄     ██ ▀█   █          ║
# ║    ▒▓█    ▄ ▒██  ▀█▄  ░ ▓██▄   ▓██░ ██▓▒▒██▒▒██  ▀█▄  ▓██  ▀█ ██▒         ║
# ║    ▒▓▓▄ ▄██▒░██▄▄▄▄██   ▒   ██▒▒██▄█▓▒ ▒░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒         ║
# ║    ▒ ▓███▀ ░ ▓█   ▓██▒▒██████▒▒▒██▒ ░  ░░██░ ▓█   ▓██▒▒██░   ▓██░         ║
# ║    ░ ░▒ ▒  ░ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░▓   ▒▒   ▓▒█░░ ▒░   ▒ ▒          ║
# ║      ░  ▒     ▒   ▒▒ ░░ ░▒  ░ ░░▒ ░      ▒ ░  ▒   ▒▒ ░░ ░░   ░ ▒░         ║
# ║    ░          ░   ▒   ░  ░  ░  ░░        ▒ ░  ░   ▒      ░   ░ ░          ║
# ║    ░ ░            ░  ░      ░            ░        ░  ░         ░          ║
# ║    ░                                                                      ║
# ║                 ░▒▓█►─═ BLOOD RITUAL SETUP ═─◄█▓▒░                        ║
# ║                                                                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

set -euo pipefail

# ═══════════════════════════════════════════════════════════════════════════
# CONFIGURATION
# ═══════════════════════════════════════════════════════════════════════════

readonly PACKAGES=(
    
    #kerneldom-and-its-political-factions
    "linux"
    "linux-headers"
    "linux-zen"
    "linux-zen-headers"
    "linux-lts"
    "linux-lts-headers"
    "linux-hardened"
    "linux-hardened-headers"

    #shells-for-people-who-like-their-terminal-with-attitude
    "zsh"
    "fish"

    #terminal-emulator-collectors
    "alacritty"
    "kitty"
    "ghostty"

    #tiling-window-manager-flex
    "hyprland"
    "niri"

    #hyprland-groupie-merchandise
    "hyprlock"
    "hyprshot"
    "hyprsunset"
    "hyprsome"
    "nwg-displays"
    "nwg-look"

    #rice-dont-bring-the-plate
    "waybar"
    "eww"
    "swww"
    "rofi-wayland"

    #vim-but-make-it-your-personality
    "neovim"
    "helix"

    #when-you-peaked-in-high-school-coding
    "thonny"
    
    #browser-hoarding-is-not-a-phase-mom
    "curl"
    "wget"
    "brave-bin"
    "zen-browser-bin"
    "firefox"
    "firefox-esr-bin"
    "librewolf-bin"
    "chromium"
    "vivaldi"
    "abrowser-bin"

    #antisocial-social-media
    "weechat"
    "hexchat"
    "telegram-desktop"
    "thunderbird"

    #because-one-video-player-is-for-normies
    "vlc"
    "mpv"
    "mpc"

    #need-a-lab
    "virtualbox-host-dkms"

    #professional-script-kiddie-starter-pack
    "zaproxy"
    "burpsuite"
    "sqlmap"
    "wireshark-qt"
    "tcpdump"
    "hoppscotch-bin"
    "postman-bin"

    #tinfoil-hat-required
    "hiddify-next-bin"
    "bitwarden"
    "metadata-cleaner"
    "onionshare"
    "tor"
    "proxychains"
    
    #rice-monitoring-dashboard-addiction
    "btop"
    "gotop-bin"
    "nvtop"
    "fastfetch"
    "nitch"
    "cava"

    #unglamorous-adulting-software
    "wl-clipboard"
    "brightnessctl"
    "file-roller"
    "zip"
    "p7zip"
    "rar"
    "localsend-bin"
    "bat"

    #bluetooth-for-wallflowers
    "bluez"
    "bluez-utils"
    "blueman"

    #gui-file-managers-are-for-losers
    "ranger"
    "yazi"
    #maybe-not-dk
    "thunar"

    #stuff-that-actually-matters
    "docker"
    "dbeaver"

    #tired-of-this-battery
    "power-profiles-daemon"

    #Book
    "zathura"
    "zathura-pdf-mupdf"

    #Fonts
    "nerd-fonts"

    #noobies_programming
    "python"
    "nodejs"
    "npm"
)

readonly REPO_URL="https://github.com/c45p14n/BloodRitual.git"
readonly CLONE_DIR="/tmp/caspian_setup_$$"
readonly KEEP_REPO=false  # Set to true to keep cloned repo

# Map source files/dirs in repo to destination paths
declare -A FILE_MAPPINGS=(
    ["Caspian-Shell"]="$HOME/.config/caspian-shell"
    ["alacritty"]="$HOME/.config/alacritty"
    ["btop"]="$HOME/.config/btop"
    ["cava"]="$HOME/.config/cava"
    ["eww"]="$HOME/.config/eww"
    ["fastfetch"]="$HOME/.config/fastfetch"
    ["helix"]="$HOME/.config/helix"
    ["hypr"]="$HOME/.config/hypr"
    ["kitty"]="$HOME/.config/kitty"
    ["mpd"]="$HOME/.config/mpd"
    ["mpv"]="$HOME/.config/mpv"
    ["niri"]="$HOME/.config/niri"
    ["nvim"]="$HOME/.config/nvim"
    ["rofi"]="$HOME/.config/rofi"
    ["rofi-bak"]="$HOME/.config/rofi-bak"
    ["rofi-bak-b&b"]="$HOME/.config/rofi-bak-b&b"
    ["shellcnfgs"]="$HOME/shellcnfgs"
    ["waybar"]="$HOME/.config/waybar"
    ["zathura"]="$HOME/.config/zathura"
)

# ===========================================================================
# UTILITY FUNCTIONS
# ===========================================================================

log_info() {
    echo -e "\033[1;36m[INFO]\033[0m $*"
}

log_success() {
    echo -e "\033[1;32m[✓]\033[0m $*"
}

log_error() {
    echo -e "\033[1;31m[✗]\033[0m $*" >&2
}

log_warn() {
    echo -e "\033[1;33m[⚠]\033[0m $*"
}

cleanup() {
    if [[ -d "$CLONE_DIR" ]] && [[ "$KEEP_REPO" == false ]]; then
        log_info "Cleaning up temporary files..."
        rm -rf "$CLONE_DIR"
    fi
}

trap cleanup EXIT

# ===========================================================================
# AUR HELPER DETECTION
# ===========================================================================

detect_aur_helper() {
    if command -v paru &>/dev/null; then
        echo "paru"
    elif command -v yay &>/dev/null; then
        echo "yay"
    else
        log_error "Neither paru nor yay found. Please install an AUR helper first."
        exit 1
    fi
}

# ===========================================================================
# PACKAGE INSTALLATION
# ===========================================================================

install_packages() {
    local aur_helper="$1"
    shift
    local packages=("$@")
    
    log_info "Installing packages with $aur_helper..."
    
    for package in "${packages[@]}"; do
        if pacman -Qi "$package" &>/dev/null; then
            log_warn "$package is already installed. Skipping..."
            continue
        fi
        
        log_info "Installing $package..."
        if $aur_helper -S --noconfirm --needed "$package"; then
            log_success "$package installed successfully"
        else
            log_error "Failed to install $package"
            return 1
        fi
    done
    
    log_success "All packages processed"
}

# ===========================================================================
# REPOSITORY OPERATIONS
# ===========================================================================

clone_repository() {
    log_info "Cloning repository from $REPO_URL..."
    
    if [[ -d "$CLONE_DIR" ]]; then
        log_warn "Clone directory already exists. Removing..."
        rm -rf "$CLONE_DIR"
    fi
    
    if git clone "$REPO_URL" "$CLONE_DIR"; then
        log_success "Repository cloned successfully"
        return 0
    else
        log_error "Failed to clone repository"
        return 1
    fi
}

deploy_files() {
    log_info "Deploying files to their destinations..."
    
    for source in "${!FILE_MAPPINGS[@]}"; do
        local src_path="$CLONE_DIR/$source"
        local dest_path="${FILE_MAPPINGS[$source]}"
        
        if [[ ! -e "$src_path" ]]; then
            log_warn "Source path $source does not exist in repository. Skipping..."
            continue
        fi
        
        # Create parent directory if it doesn't exist
        local dest_parent
        if [[ -d "$src_path" ]]; then
            dest_parent="$dest_path"
        else
            dest_parent=$(dirname "$dest_path")
        fi
        
        mkdir -p "$dest_parent"
        
        # Backup existing files/directories
        if [[ -e "$dest_path" ]]; then
            local backup_path="${dest_path}.backup.$(date +%Y%m%d_%H%M%S)"
            log_warn "Destination $dest_path exists. Creating backup at $backup_path"
            mv "$dest_path" "$backup_path"
        fi
        
        # Copy files
        log_info "Copying $source -> $dest_path"
        if cp -r "$src_path" "$dest_path"; then
            log_success "Successfully deployed $source"
        else
            log_error "Failed to deploy $source"
            return 1
        fi
    done
    
    log_success "All files deployed successfully"
}

# ===========================================================================
# MAIN EXECUTION
# ===========================================================================

print_banner() {
    clear
    echo -e "\033[1;31m"
    cat << 'EOF'
╔═══════════════════════════════════════════════════════════════════════════╗
║                                                                           ║
║     ▄████▄   ▄▄▄        ██████  ██▓███   ██▓ ▄▄▄       ███▄    █          ║
║    ▒██▀ ▀█  ▒████▄    ▒██    ▒ ▓██░  ██▒▓██▒▒████▄     ██ ▀█   █          ║
║    ▒▓█    ▄ ▒██  ▀█▄  ░ ▓██▄   ▓██░ ██▓▒▒██▒▒██  ▀█▄  ▓██  ▀█ ██▒         ║
║    ▒▓▓▄ ▄██▒░██▄▄▄▄██   ▒   ██▒▒██▄█▓▒ ▒░██░░██▄▄▄▄██ ▓██▒  ▐▌██▒         ║
║    ▒ ▓███▀ ░ ▓█   ▓██▒▒██████▒▒▒██▒ ░  ░░██░ ▓█   ▓██▒▒██░   ▓██░         ║
║    ░ ░▒ ▒  ░ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░▓   ▒▒   ▓▒█░░ ▒░   ▒ ▒          ║
║      ░  ▒     ▒   ▒▒ ░░ ░▒  ░ ░░▒ ░      ▒ ░  ▒   ▒▒ ░░ ░░   ░ ▒░         ║
║    ░          ░   ▒   ░  ░  ░  ░░        ▒ ░  ░   ▒      ░   ░ ░          ║
║    ░ ░            ░  ░      ░            ░        ░  ░         ░          ║
║    ░                                                                      ║
║                 ░▒▓█►─═ BLOOD RITUAL SETUP ═─◄█▓▒░                        ║
║                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "\033[0m"
    echo ""
}

main() {
    print_banner
    log_info "Starting Caspian setup ritual..."
    echo ""
    
    # Check for git
    if ! command -v git &>/dev/null; then
        log_error "git is not installed. Please install git first."
        exit 1
    fi
    
    # Detect AUR helper
    local aur_helper
    aur_helper=$(detect_aur_helper)
    log_success "Detected AUR helper: $aur_helper"
    echo ""
    
    # Install packages
    install_packages "$aur_helper" "${PACKAGES[@]}"
    echo ""
    
    # Clone repository
    clone_repository
    echo ""
    
    # Deploy files from repo
    deploy_files
    echo ""
    
    if [[ "$KEEP_REPO" == true ]]; then
        log_info "Repository preserved at: $CLONE_DIR"
    fi
    
    log_success "Setup ritual complete! May the code be with you."
}

# ===========================================================================
# ENTRY POINT
# ===========================================================================

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
