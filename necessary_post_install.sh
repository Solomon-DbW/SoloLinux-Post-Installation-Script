#!/usr/bin/env bash
set -e  # Exit on error

cd ~

# Install Git
sudo pacman -S --noconfirm git

# Install fonts
sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu
fc-cache -fv

# Starship prompt installation
curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> ~/.bashrc   
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Zsh and plugins
sudo pacman -S --noconfirm zsh zsh-autosuggestions figlet exa zoxide

# Change default shell to zsh
chsh -s $(which zsh)

# Yay AUR helper install
cd ~
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# AUR packages
yay -S --noconfirm brave-bin hyprshade

# Get SoloLinux config files
cd ~
git clone https://github.com/Solomon-DbW/SoloLinux_GUI
mv SoloLinux_GUI/* ~/.config/

git clone https://github.com/Solomon-DbW/SoloLinux
mv SoloLinux/kitty ~/.config/

# Install Hyprland and related packages
sudo pacman -S --noconfirm hyprland hyprpaper hyprlock waybar rofi fastfetch cpufetch brightnessctl kitty ly virt-manager networkmanager nvim emacs

# Enable services
sudo systemctl enable NetworkManager
sudo systemctl enable ly

# Start hyprpaper
hyprpaper &

echo "Setup complete! Please log out and log back in for all changes to take effect. Run 'source ~/.zshrc to source zsh'"


# #!/usr/bin/env bash
# set -e  # Exit on error
#
# cd ~
#
# # Install Git
# sudo pacman -S git
#
# # Install Jetbrains Nerd Font Mono
# sudo pacman -S ttf-jetbrains-mono
#
# # Install Noto fonts to prevent Brave browser font bug
# sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-dejavu
#
# # Rebuild font cache
# fc-cache -fv
#
# # Starship prompt installation
# curl -sS https://starship.rs/install.sh | sh
# echo 'eval "$(starship init bash)"' >> ~/.bashrc   
# echo 'eval "$(starship init zsh)"' >> ~/.zshrc
#
# # Zsh plugins install
# sudo pacman -S zsh-autosuggestions figlet exa zoxide
#
# # Zsh-autosuggestions plugininstall
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#
# source .bashrc 
#
# # Zsh shell installation
# sudo pacman -S zsh
#
# # Changing the default shell to zsh
# chsh -s $(which zsh)
#
# source .zshrc
#
# # Yay AUR helper install
# sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
#
# # Brave web browser install via yay
# yay -S brave-bin hyprshade
#
# # Getting SoloLinux config files
# cd ~ && git clone https://github.com/Solomon-DbW/SoloLinux_GUI && mv SoloLinux_GUI/* ~/.config
# cd ~ && git clone https://github.com/Solomon-DbW/SoloLinux && mv SoloLinux/kitty ~/.config
#
# # Installing useful packages
# sudo pacman -S hyprland hyprpaper hyprlock waybar rofi fastfetch cpufetch brightnessctl kitty ly virt-manager networkmanager
#
# # Starting hyprpaper for wallpaper to take effect
# hyprpaper &
