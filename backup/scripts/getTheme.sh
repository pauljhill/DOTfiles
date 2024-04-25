#!/bin/bash

get_current_gtk_theme() {
    gtk_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
    # Extract theme name from the output (remove quotes)
    gtk_theme=${gtk_theme#\'}
    gtk_theme=${gtk_theme%\'}
    echo "$gtk_theme"
}

current_theme=$(get_current_gtk_theme)
echo " $current_theme"

