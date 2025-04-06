#!/bin/bash
echo "Script executed at $(date)" >> ~/dotfiles/spotify/keybinds/log.log
status=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
    string:"org.mpris.MediaPlayer2.Player" string:"PlaybackStatus" | grep -oP 'string "\K\w+')
if pgrep spotify >/dev/null; then
    if [ "$status" == "Playing" ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
    elif [ "$status" == "Paused" ]; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play
    fi
fi