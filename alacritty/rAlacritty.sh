if hyprctl clients | grep 'class: lyrics'; then
    killall alacritty
else
    alacritty --config-file ~/dotfiles/alacritty/rLyrics.toml
fi