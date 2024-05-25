#!/bin/bash


#sudo pacman -S --noconfirm 
sudo pacman -S  --noconfirm dnsmasq qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs


i need a bash script that dose the following

Edit /etc/libvirt/libvirtd.conf (Change the following Lines)
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"


if the lines are not in the file add them