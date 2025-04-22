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
    wofi
    dunst
    swww
    swaylock-effects
    swayidle
    brightnessctl
    pamixer
    cliphist
    grim
    slurp
    swappy

    # # Fonts
    # nerdfonts
    # noto-fonts
    # noto-fonts-cjk
    # noto-fonts-emoji

    # Themes & Icons
    catppuccin-gtk
    papirus-icon-theme

  ];

  # Optional: Autologin & set Hyprland as default
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "hyprland";
  };
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
  };
  # Set default session
  programs.hyprland.xwayland.enable = true;
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "Hyprland";
      user = "abdyllaan"; # Ganti dengan nama user kamu
    };
  };


}

