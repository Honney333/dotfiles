# dotfiles for OLED theme

## additional changes

### set the XDG_CONFIG for swaylock automatically
add export XDG_CONFIG_HOME="$HOME/.config" to /etc/profile

The .root folder means thet it is in the root directory ('/'). Do not just copy it because it is very System Specific.

# What is what:

### Notification: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter?tab=readme-ov-file#sway-usage)
>old (simpler): [Mako](https://github.com/emersion/mako)

### /etc/fstab

### /boot/grub

## Change Icons

### OneDriveGUI
ICON

Default Directory: ```/usr/lib/OneDriveGUI/resources/images/OneDriveGUI.ico```

Replace Icon (Soft-Mod):

```
rsvg-convert -w 48 -h 48 -o $HOME/OneDriveGUI.ico $HOME/.icons/BeautyLine-V3/apps/scalable/ms-onedrive.svg

sudo mv $HOME/OneDriveGUI.ico /usr/lib/OneDriveGUI/resources/images/
```

Edit the Program (Hard-Mod):
>Probably needs to be redone when it updates


```
sudo sed -i "s|^Icon=.*|Icon=$HOME/.icons/BeautyLine-V3/apps/scalable/ms-onedrive.svg|" /usr/share/applications/onedrivegui.desktop
```

Tray-ICON

Default Directory: ```/usr/lib/OneDriveGUI/resources/images/icons8-clouds-80-dark-edge.png```

Replace Icon (Soft-Mod):

```
rsvg-convert -w 80 -h 80 -o $HOME/OneDriveGUI.ico $HOME/.icons/BeautyLine-V3/apps/scalable/ms-onedrive.svg

sudo mv $HOME/OneDriveGUI.ico /usr/lib/OneDriveGUI/resources/images/
```

Edit the Program (Hard-Mod):
>Probably needs to be redone when it updates

```
sudo sed -i 's|DIR_PATH + "/resources/images/icons8-clouds-80-dark-edge.png"|os.path.expanduser("~/.icons/BeautyLine-V3/apps/scalable/ms-onedrive.svg")|g' /usr/lib/OneDriveGUI/OneDriveGUI.py
```

### Remmina

Icon name: ```org.remmina.Remmina.png``` | ```org.remmina.Remmina```
```
Exec=/usr/bin/remmina --icon
```

### Discord (Vencord.Vesktop)

Replace Icon (Soft-Mod):


```
sudo sed -i "s|^Icon=.*|Icon=$HOME/.icons/BeautyLine-V3/apps/scalable/discord.svg|" /usr/share/applications/vesktop.desktop
```

# Theme Templates

### [grub](https://www.gnu.org/software/grub/)
[Theme Collection - Github](https://github.com/jacksaur/Gorgeous-GRUB)
>used: [poly-dark](https://github.com/shvchk/poly-dark)

### [waybar](https://github.com/Alexays/Waybar)
[Theme Collection - Github](https://github.com/topics/waybar-themes)
>used and edited: [Catppuccin](https://github.com/catppuccin/waybar) | alternative: [sameeul-haque](https://github.com/sameemul-haque/dotfiles)

### [rofi](https://github.com/davatorium/rofi)
[Theme Collection - Github](https://github.com/newmanls/rofi-themes-collection)
>used and edited: [Catppuccin](https://github.com/catppuccin/rofi)

### [sddm](https://github.com/sddm/sddm)
[Theme Collection - Github](https://github.com/topics/sddm-theme)
>used and edited: [Catppuccin](https://github.com/catppuccin/sddm) | alternative: [sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)

### [GTK 3/4](https://www.gtk.org/)
Set in sway config

[Theme Search - KDE](https://store.kde.org/browse?cat=135&ord=latest)
>used and edited: [adwaita-dark Amoled](https://gitlab.com/tearch-linux/artworks/themes-and-icons/adwaita-dark-amoled) | alternative: [Graphite-Dark](https://github.com/vinceliuice/Graphite-gtk-theme)

### [Kvantum](https://github.com/tsujan/Kvantum/tree/master/Kvantum)
Set in Kvantum and then in qt6ct and qt5ct

[Theme Search - KDE](https://store.kde.org/browse?cat=123&ord=latest)
>used and edited: [Black Glas](https://www.opencode.net/phob1an/blackglass) | alternative: [Black-Colors](https://gitlab.com/alexevier/kvantumthemes/-/tree/main/Black-Colors)

### [Sway](https://swaywm.org/)
>used and edited: [Catppuccin](https://github.com/catppuccin/i3)

### [Swaylock](https://github.com/swaywm/swaylock)
>used and edited: [Catppuccin](https://github.com/catppuccin/swaylock)

### [Swaync](https://github.com/ErikReider/SwayNotificationCenter)
>used and edited: [Catppuccin](https://github.com/catppuccin/swaync)

### Cursor
Set in sway config

[Theme Search - KDE](https://store.kde.org/s/KDE%20Store/browse?cat=107&ord=latest)
>used and edited: [DJ-FOX-C](https://store.kde.org/s/KDE%20Store/p/2113007)

### Icons
Set in sway config

>used and edited: [BeautyLine](https://github.com/gvolpe/BeautyLine)

### [Steam](https://store.steampowered.com/)
Install [Millennium](https://github.com/SteamClientHomebrew/Millennium) and go to Steam>Settings>Themes there you can open the Folder and Choose the Theme

[Theme Collection - steambrew.app](https://steambrew.app/themes)
>used: [Minimal Dark](https://github.com/SaiyajinK/Minimal-Dark-for-Steam/) | Alternatives: [Zehn](https://github.com/yurisuika/Zehn/) or [SpaceTheme](https://github.com/SpaceTheme/Steam/)

### [Discord](https://discord.com/)
Install [Vesktop](https://github.com/Vencord/Vesktop) go to Discord>Settings>Vencord>Themes

[Theme Collection - github](https://github.com/topics/vencord-theme) or [Theme Collection - betterdiscord](https://betterdiscord.app/themes)
>used: [AMOLED-CORD](https://github.com/LuckFire/amoled-cord) | Alternative: [Dark Neon](https://github.com/B4T3S/DiscordDarkNeon) or [Space Theme](https://github.com/SpaceTheme/Discord/)
