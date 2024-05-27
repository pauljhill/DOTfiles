
#!/bin/sudo /bin/bash

pacman -Syu cmake gcc libgl libegl fontconfig spice-protocol make nettle pkgconf binutils \
            libxi libxinerama libxss libxcursor libxpresent libxkbcommon wayland-protocols \
            ttf-dejavu libsamplerate
pacman -Syu dkms linux-headers
