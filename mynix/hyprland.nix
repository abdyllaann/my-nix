{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    ags # desktop overview  
    btop
    brightnessctl # for brightness control
    cava
    cliphist
    loupe
    gnome-system-monitor
    grim
    gtk-engine-murrine #for gtk themes
    hypridle
    imagemagick
    inxi
    jq
    kitty
    libsForQt5.qtstyleplugin-kvantum #kvantum
    networkmanagerapplet
    nwg-displays
    nwg-look
    nvtopPackages.full
    pamixer
    pavucontrol
    playerctl
    polkit_gnome
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum #kvantum
    rofi-wayland
    slurp
    swappy
    swaynotificationcenter
    swww
    unzip
    wallust
    wl-clipboard
    wlogout
    xarchiver
    yad
    yt-dlp

    # # Fonts
    # nerdfonts
    # noto-fonts
    # noto-fonts-cjk
    # noto-fonts-emoji

    # Themes & Icons
    catppuccin-gtk
    papirus-icon-theme

  ];


  programs = {
    # hyprland = {
    #   enable = true;
    #   #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland; #hyprland-git
    #   #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland; #xdph-git
    #
    #   portalPackage = pkgs.xdg-desktop-portal-hyprland; # xdph none git
    #   xwayland.enable = true;
    # };


    waybar.enable = true;
    hyprlock.enable = true;
    firefox.enable = true;
    git.enable = true;
    nm-applet.indicator = true;
    #neovim.enable = true;

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

    virt-manager.enable = false;

    #steam = {
    #  enable = true;
    #  gamescopeSession.enable = true;
    #  remotePlay.openFirewall = true;
    #  dedicatedServer.openFirewall = true;
    #};

    xwayland.enable = true;

    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

  };

  # Extra Portal Configuration
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };


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

