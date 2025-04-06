#!/bin/bash
currentVolume=$(dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call --print-reply /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:"Volume" | awk -F 'double ' '{print $2}' | awk '{print $1}')
newVolume=$(echo "$currentVolume + 0.05" | bc -l)

if (( $(echo "$newVolume > 1" | bc -l) )) then
    $newVolume=1.0
fi
dbus-send --session --dest=org.mpris.MediaPlayer2.spotify --type=method_call --print-reply /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Set string:"org.mpris.MediaPlayer2.Player" string:"Volume" variant:double:"$newVolume"