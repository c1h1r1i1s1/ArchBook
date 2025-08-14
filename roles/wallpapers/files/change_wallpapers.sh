#!/bin/bash

HOUR=$(date +"%H")
echo $HOUR

if [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 17 ]; then
    WALLPAPER="/home/c1h1r1i1s1/Pictures/Wallpapers/day.jpg"
    THEME_NAME="oomox-day"
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 23 ]; then
    WALLPAPER="/home/c1h1r1i1s1/Pictures/Wallpapers/evening.jpg"
    THEME_NAME="oomox-evening"
else
    WALLPAPER="/home/c1h1r1i1s1/Pictures/Wallpapers/night.jpg"
    THEME_NAME="oomox-night"
fi

gsettings set org.cinnamon.desktop.background picture-uri "file://$WALLPAPER"
gsettings set org.cinnamon.desktop.interface gtk-theme "$THEME_NAME"
gsettings set org.cinnamon.desktop.interface icon-theme "$THEME_NAME"
gsettings set org.cinnamon.theme name "$THEME_NAME"

wal -i "$WALLPAPER"
# Auto-detect Firefox profile and copy pywal CSS
profile_dir="$(find "$HOME/.mozilla/firefox" -maxdepth 1 -type d \( -name "*.default" -o -name "*.default-*" -o -name "*.default-esr" -o -name "*.default-esr*" \) | head -n1)"
if [ -n "$profile_dir" ]; then
  mkdir -p "$profile_dir/chrome"
  cp "$HOME/.cache/wal/firefox_content.css" "$profile_dir/chrome/userContent.css"
fi