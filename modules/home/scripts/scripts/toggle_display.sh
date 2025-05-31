#!/usr/bin/env bash

# Pilihan menu
CHOICE=$(printf "Mirror\nExtend (Right)\nExtend (Left)\nExternal Only\nInternal Only" | rofi -dmenu -p "Display Mode")
INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"

case "$CHOICE" in
Mirror)
  swaymsg output "$EXTERNAL" enable position 0 0
  swaymsg output "$INTERNAL" position 0 0
  notify-send -t 5000 "Display Mode" "Mirrored"
  ;;

"Extend (Right)")
  swaymsg output "$INTERNAL" enable position 0 0
  swaymsg output "$EXTERNAL" enable position 1920 0
  notify-send -t 5000 "Display Mode" "Extended (Right)"
  ;;

"Extend (Left)")
  swaymsg output "$EXTERNAL" enable position 0 0
  swaymsg output "$INTERNAL" enable position 1920 0
  notify-send -t 5000 "Display Mode" "Extended (Left)"
  ;;

"External Only")
  swaymsg output "$INTERNAL" disable
  swaymsg output "$EXTERNAL" enable position 0 0
  notify-send -t 5000 "Display Mode" "External Only"
  ;;

"Internal Only")
  swaymsg output "$EXTERNAL" disable
  swaymsg output "$INTERNAL" enable position 0 0
  notify-send -t 5000 "Display Mode" "Internal Only"
  ;;

*)
  notify-send "Display Mode" "Cancelled or Unknown Option"
  ;;
esac
# case "$CHOICE" in
# Extend)
#   swaymsg output "$EXTERNAL" enable position 1920 0
#   notify-send "Display Mode" "Extended"
#   ;;
# Mirror)
#   swaymsg output "$EXTERNAL" enable position 0 0
#   swaymsg output "$INTERNAL" position 0 0
#   notify-send "Display Mode" "Mirrored"
#   ;;
# *) ;;
# esac
