#!/bin/sudo /bin/bash

CONF_FILE="/etc/libvirt/libvirtd.conf"

if grep -q "^# unix_sock_group = \"libvirt\"$" "$CONF_FILE"; then
  sed -i "s/^# *unix_sock_group *=.*/unix_sock_group = \"libvirt\"/" "$CONF_FILE"
fi

if grep -q "^# unix_sock_rw_perms = \"0770\"$" "$CONF_FILE"; then
  sed -i "s/^# *unix_sock_rw_perms *=.*/unix_sock_rw_perms = \"0770\"/" "$CONF_FILE"
fi

# Add the lines if they're not already present
if ! grep -q "^unix_sock_group = \"libvirt\"$" "$CONF_FILE"; then
  echo "unix_sock_group = \"libvirt\"" >> "$CONF_FILE"
fi

if ! grep -q "^unix_sock_rw_perms = \"0770\"$" "$CONF_FILE"; then
  echo "unix_sock_rw_perms = \"0770\"" >> "$CONF_FILE"
fi

usermod -a -G libvirt $(whoami).
systemctl enable --now libvirtd
systemctl start libvirtd


#this script is trying do do the following

# newgrp libvirt

# Edit /etc/libvirt/libvirtd.conf (Change the following Lines)

# unix_sock_group = "libvirt"
# unix_sock_rw_perms = "0770"

# sudo usermod -a -G libvirt $(whoami)
# systemctl enable --now libvirtd
# systemctl start libvirtd