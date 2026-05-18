#!/bin/bash

PROGRAMS=(
    "vivaldi"
    "brave-browser"
    "spotify"
    "obsidian"
    "steam"
    "picom --experimental-backends --daemon"
)

LAUNCHMEDADDY=(
    "signal-desktop"
    "wezterm start --class deez-nuts"
    "telegram-desktop"
    "nitrogen --restore"
    "tmux-daemon"
    "discord"
    "nm-applet"
    "brightnessctl -c backlight set 100%"
    "autorandr docked"
)

HASCTE=false

for i in "${PROGRAMS[@]}"; do
    if ! pgrep "$i" &>/dev/null; then
        $i &>/dev/null &
    elif pgrep "$i" &>/dev/null; then
        HASCTE=true
    fi
done

echo "$HASCTE"

if ! "$HASCTE"; then
    for i in "${LAUNCHMEDADDY[@]}"; do
        $i &>/dev/null &
    done
fi

NUM_MONITORS=$(xrandr | grep " connected" | awk 'END { print NR }')
HAS_ULTRAWIDE=$(xrandr | grep "HDMI-0")

echo num monitors "$NUM_MONITORS"
if [ "$NUM_MONITORS" -gt 1 ]; then
    if [ "$HAS_ULTRAWIDE" ]; then
        autorandr docked-studio
    else
        autorandr docked
    fi
else
    autorandr undocked
fi
