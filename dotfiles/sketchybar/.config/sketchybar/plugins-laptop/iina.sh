#!/usr/bin/env bash

# iina.sh — SketchyBar plugin
# Shows the current IINA "now playing" title based on the window name.

get_iina_title() {
	local title
	title="$(
		osascript <<'EOF'
tell application "System Events"
    if exists (process "IINA") then
        tell process "IINA"
            if exists window 1 then
                set winTitle to name of window 1
            else
                set winTitle to ""
            end if
        end tell
    else
        set winTitle to ""
    end if
end tell
return winTitle
EOF
	)"

	# Strip common decorations like " - IINA" or "IINA - "
	title="${title% - IINA}"
	title="${title#IINA - }"

	echo " $title"
}

update_item() {
	local title
	title="$(get_iina_title)"

	if [ -z "$title" ]; then
		# Nothing playing / IINA not open -> hide label
		sketchybar --set "$NAME" label.drawing=off
	else
		sketchybar --set "$NAME" label.drawing=on label="$title"
	fi
}

case "$SENDER" in
"routine" | "forced" | "front_app_switched" | "system_woke")
	update_item
	;;
*)
	# Fallback: just update on any unknown trigger
	update_item
	;;
esac
