#!/usr/bin/env bash

dir="$HOME/Pictures/Screenshots"
time=$(date +'%Y_%m_%d_at_%Hh%Mm%Ss')
file="${dir}/Screenshot_${time}.png"

if [[ ! -d "$dir" ]]; then
  mkdir -p "$dir"
fi

copy() {
  grim -g "$(slurp)" - | wl-copy
  notify-send -t 5000 "Screenshot copied to clipboard"
}

save() {
  grim -g "$(slurp)" "$file"
  notify-send -t 5000 "Screenshot saved to $file"
}

swappy_() {
  grim -g "$(slurp)" "$file"
  swappy -f "$file"
}

choice=$(echo -e "Copy\nSave\nEdit (Swappy)" | rofi -dmenu -p "Screenshot Mode:")

case "$choice" in
Copy)
  copy
  ;;
Save)
  save
  ;;
"Edit (Swappy)")
  swappy_
  ;;
*)
  notify-send -t 5000 "No valid option selected."
  ;;
esac

exit 0
