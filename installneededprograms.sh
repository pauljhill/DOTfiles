#!/bin/bash

sudo pacman -S  --needed base-devel git nm-connection-editor networkmanger network-mananger-applet 
sudo pacman -S  --needed  bash-completion xdg-utils samba nfs-utils micro code rofi swww nerd-fonts-git
sudo pacman -S  --needed  gparted vlc ark signal-desktop curl qt5ct qt5-wayland xfce4-terminal ristretto
sudo pacman -S  --needed  ttf-nerd-fonts-symbols pavucontrol python-pywal udiskie

#------------snapper-------
sudo pacman -S  --needed  snapper snap-pac grub-btrfs 
sudo umount /.snapshots
sudo rm -r /.snapshots
sudo snapper -c root create-config /
sudo btrfs subvolume list /
sudo btrfs subvolume delete /.snapshots
cd /
sudo mkdir .snapshots
sudo mount -a
sudo btrfs subvolume set-default 256 /
sudo sed -i.bak 's/ALLOW_GROUPS=""/ALLOW_GROUPS="wheel"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_MIN_AGE=""""/ALLOW_GROUPS="wheel"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_LIMIT_HOURLY="10"/TIMELINE_LIMIT_HOURLY="5"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_LIMIT_DAYLY="10"/TIMELINE_LIMIT_DAYLY="7"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_LIMIT_WEEKLY="0"/TIMELINE_LIMIT_WEEKLY="1"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_LIMIT_MONTHLY="10"/TIMELINE_LIMIT_MONTHLY="0"/' /etc/snapper/configs/root
sudo sed -i.bak 's/TIMELINE_LIMIT_YEARLY="10"/TIMELINE_LIMIT_YEARLY="0"/' /etc/snapper/configs/root
sudo chown -R :wheel /.snapshots
sudo systemctl enable --now grub-btrfsd.service
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl enable --now snapper-timeline.timer 
sudo systemctl enable --now snapper-cleanup.timer
sudo snapper -c root create -d "fist man snap"
sudo grub-mkconfig -o /boot/grub/grub.cfg
# need to do something about restoring snaps from 37min
# https://www.youtube.com/watch?v=_97JOyC1o2o


#the following block is for VM's
#sudo pacman -S --noconfirm virt-viewer virt-manager qemu-base vde2 nftables dnsmasq bridge-utils ovmf swtpm
#edtables iptables-nft // these are allready on the arco linux instance
mkdir $HOME/git
cd git 
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ~


# apps needed 
paru -S  alacritty nwg-displays nwg-drawer nwg-look nwg-clipman swaync pacseek swappy brave-bin waybar thunar 
paru -S  snapper-gui wlogout wayland-logout 
 # apps i like 
paru -S  github-desktop-bin 
#themes 
paru -S  sddm-slice-git xcursor-breeze sweet-gtk-theme dracula-gtk-theme	tela-circle-icon-theme-dracula




mkdir $HOME/mnt/
mkdir $HOME/mnt/CargoBay
mkdir $HOME/mnt/Media
mkdir $HOME/mnt/docker
sudo echo "10.0.1.2:/mnt/CargoBay/Media    $HOME/mnt/Media nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo echo "10.0.1.2:/mnt/CargoBay/docker   $HOME/mnt/docker nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo echo "10.0.1.2:/mnt/CargoBay/CargoBay $HOME/mnt/CargoBay nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo systemctl daemon-reload
sudo mount -a
duf

# test change for git commit 



# idle system 
# fix thunar openterm 
# get themes working eith mod R
# get snapper grub working 
# waybar things i want in it ----- > todo   idleswitch power button screenshot
# 3 diffrent bars depending on screen 


