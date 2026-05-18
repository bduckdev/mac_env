!#/bin/bash

# Check if spotify is playing
if [ $(playerctl status 2> /dev/null) = "Playing" ]; then
    echo " $(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo ""
fi
