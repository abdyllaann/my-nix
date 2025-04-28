{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Hyprland
    hyprland
    hyprpaper
    hyprpicker

    # Dependencies
    swaybg
    waybar
    swaylock
    swayidle
    wpaperd
    mpvpaper
    swww
    kitty
    wofi
    bemenu
    fuzzel
    tofi

  ];
}
