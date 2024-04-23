
sudo pacman -S --noconfirm bash-completion github-desktop-bin


#the following block is for VM's
#sudo pacman -S --noconfirm virt-viewer virt-manager qemu-base vde2 nftables dnsmasq bridge-utils ovmf swtpm
#edtables iptables-nft // these are allready on the arco linux instance



#display manger i like
paru -S --noconfirm nwg-displays 


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
