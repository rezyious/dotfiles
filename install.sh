#!/bin/bash

ask() {
    read -rp "$1 [y/N]: " response
    [[ "$response" =~ ^[Yy]$ ]]
}

echo "=== Setup Script ==="

# System update
if ask "Update system with pacman -Syu?"; then
    sudo pacman -Syu
fi

# Main package install
if ask "Install standard packages?"; then
    sudo pacman -S neovim git tmux p7zip bat bc bind blanket brightnessctl btop dysk evince fd \
        ffmpegthumbnailer firefox fzf ghostty gnome-text-editor gimp gnome-calculator gnome-clocks \
        gnome-system-monitor htop jq kitty lsd man-db man-pages nano nautilus ncdu neofetch \
        network-manager-applet networkmanager nload obs-studio qbittorrent ripgrep parallel \
        pavucontrol proxychains-ng shotcut stow vlc tree wget curl wl-clipboard sway swaybg \
        swayidle swaylock traceroute unrar waybar wofi xclip xdg-desktop-portal-gnome \
        xdg-desktop-portal-wlr xterm yazi yelp zoxide zsh ffmpeg tokei slurp vlc-plugins-all
fi


# Yay install
if ask "Install yay AUR helper?"; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    cd ..
    rm -rf yay-bin
fi

# screenshot depends on slurp
yay -S shotman

# # Rust install
# if ask "Install Rust via rustup?"; then
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# fi
#
#
# # TPM (tmux plugin manager)
# if ask "Install tmux plugin manager (TPM)?"; then
#     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# fi
#
# # Oh-my-zsh
# if ask "Install oh-my-zsh?"; then
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi
#
#
# # Go install (latest stable)
# if ask "Install latest stable Go from official source?"; then
#     GO_VERSION=$(curl -s https://go.dev/VERSION?m=text)
#     wget "https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz"
#     sudo rm -rf /usr/local/go
#     sudo tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz"
#     echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
#     echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
#     source ~/.bashrc 2>/dev/null || true
#     source ~/.zshrc 2>/dev/null || true
#     rm "${GO_VERSION}.linux-amd64.tar.gz"
# fi

echo "✅ All selected tasks completed."
