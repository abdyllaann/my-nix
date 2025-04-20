{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    kitty
    dmenu
    wl-clipboard
    xdg-utils
    xwayland
  ];

  # Optional: Autologin & set Hyprland as default
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "hyprland";
  };
}

