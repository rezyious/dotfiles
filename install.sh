#!/bin/bash

# starship
curl -sS https://starship.rs/install.sh | sh

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
        pavucontrol proxychains-ng kdenlive stow vlc tree wget curl wl-clipboard sway swaybg \
        swayidle swaylock traceroute unrar waybar wofi xclip xdg-desktop-portal-gnome \
        xdg-desktop-portal-wlr xterm yazi yelp zoxide zsh ffmpeg tokei slurp vlc-plugins-all \
        nsxiv wmenu noto-fonts-cjk tokei
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
yay -S shotman brave-bin freedownloadmanager 


echo "All selected tasks completed."
