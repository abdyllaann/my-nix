#!/usr/bin/env bash

# Cek apakah Bluetooth aktif
bt_powered=$(bluetoothctl show | grep "Powered: yes")

# Toggle Bluetooth
toggle_bluetooth() {
  if [[ -n "$bt_powered" ]]; then
    bluetoothctl power off && notify-send "Bluetooth" "Bluetooth dimatikan"
  else
    bluetoothctl power on && notify-send "Bluetooth" "Bluetooth diaktifkan"
  fi
}

# Tampilkan perangkat yang sudah dipair
list_paired_devices() {
  devices=$(bluetoothctl paired-devices | awk '{print $2 " " $3}')
  if [[ -z "$devices" ]]; then
    notify-send "Bluetooth" "Tidak ada perangkat yang terpasang"
    exit
  fi

  selected=$(echo "$devices" | rofi -dmenu -p "Pilih device:")
  [[ -z "$selected" ]] && exit

  mac=$(echo "$selected" | awk '{print $1}')
  name=$(echo "$selected" | cut -d' ' -f2-)

  is_connected=$(bluetoothctl info "$mac" | grep "Connected: yes")

  if [[ -n "$is_connected" ]]; then
    action=$(echo -e "Disconnect\nRemove" | rofi -dmenu -p "$name (Connected)")
    case "$action" in
    Disconnect) bluetoothctl disconnect "$mac" && notify-send "Bluetooth" "Disconnected from $name" ;;
    Remove) bluetoothctl remove "$mac" && notify-send "Bluetooth" "Removed $name" ;;
    esac
  else
    bluetoothctl connect "$mac" && notify-send "Bluetooth" "Connected to $name"
  fi
}

# Menu utama
main_menu=$(echo -e "Toggle Bluetooth\nManage Paired Devices\nExit" | rofi -dmenu -p "Bluetooth Menu")

case "$main_menu" in
"Toggle Bluetooth") toggle_bluetooth ;;
"Manage Paired Devices") list_paired_devices ;;
*) exit ;;
esac
