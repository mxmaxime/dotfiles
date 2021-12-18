# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
#ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/ \
# Place the kitty.desktop file somewhere it can be found by the OS
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/ && \
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
