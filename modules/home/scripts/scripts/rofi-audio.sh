#!/bin/sh

choice=$(printf "🔊 Volume Up\n🔉 Volume Down\n🔇 Mute\n🔈 Unmute\n🎧 Set Output (Sink)\n🎤 Set Input (Source)" | rofi -dmenu -p "Audio")

case "$choice" in
"🔊 Volume Up")
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  ;;
"🔉 Volume Down")
  pactl set-sink-volume @DEFAULT_SINK@ -5%
  ;;
"🔇 Mute")
  pactl set-sink-mute @DEFAULT_SINK@ 1
  ;;
"🔈 Unmute")
  pactl set-sink-mute @DEFAULT_SINK@ 0
  ;;
"🎧 Set Output (Sink)")
  sink=$(pactl list short sinks | awk '{print $2}' | rofi -dmenu -p "Select Output")
  [ -n "$sink" ] && pactl set-default-sink "$sink"
  ;;
"🎤 Set Input (Source)")
  src=$(pactl list short sources | awk '{print $2}' | rofi -dmenu -p "Select Input")
  [ -n "$src" ] && pactl set-default-source "$src"
  ;;
esac
