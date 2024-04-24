


sudo pacman -S --noconfirm --needed base-devel git nm-connection-editor networkmanger network-mananger-applet 
sudo pacman -S --noconfirm --needed  bash-completion xdg-utils samba nfs-utils micro code rofi
sudo pacman -S --noconfirm --needed  gparted vlc ark signal-desktop curl qt5ct qt5-wayland
sudo pacman -S --noconfirm --needed  xdg-desktop-portal-hyprland udiskie github-desktop-bin thunar gvfs-nfs gvfs-smb



#the following block is for VM's
#sudo pacman -S --noconfirm virt-viewer virt-manager qemu-base vde2 nftables dnsmasq bridge-utils ovmf swtpm
#edtables iptables-nft // these are allready on the arco linux instance




# apps needed 
paru -S --noconfirm nwg-displays nwg-drawer nwg-look nwg-clipman swaync pacseek swappy brave-bin
# apps i like 

#themes 
paru -S --noconfirm sddm-slice-git	breeze-lxqt-theme xcursor-breeze sweet-gtk-theme dracula-gtk-theme	lxdm-themes	

mkdir $HOME/mnt/
mkdir $HOME/mnt/CargoBay
mkdir $HOME/mnt/Media
mkdir $HOME/mnt/docker


sudo echo "10.0.1.2:/mnt/CargoBay/CargoBay $HOME/mnt/CargoBay nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo echo "10.0.1.2:/mnt/CargoBay/Media $HOME/mnt/Media nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo echo "10.0.1.2:/mnt/CargoBay/docker $HOME/mnt/docker nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo systemctl daemon-reload
sudo mount -a


# test change for git commit 



# idle system 
# move waybar back to .config 
# move scripts as well 
# move bg 
# get themes working
# get snapper grub working 
