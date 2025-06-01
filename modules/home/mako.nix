{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libnotify
    papirus-icon-theme
  ];

  programs.mako = {
    enable = true;
    xdg.configFile."mako/config".text = ''
      font=Maple Mono:size=12
        background-color=#141b1e
        border-color=#141b1e
        text-color=#ffffff
        progress-color=over #141b1e
        anchor=top-right
        border-radius=5
        border-size=2
        padding=20
        default-timeout=5000
        layer=top
        height=125
        width=400
    '';
    # Warna tema Everblush
    # backgroundColor = "#141b1e"; # Background
    # borderColor     = "#67b0e8"; # Blue
    # textColor       = "#dadada"; # Foreground / White
    #
    # borderSize   = 2;
    # borderRadius = 12;
    # padding      = "12";
    # margin       = "10";
    # width        = 400;
    # height       = 100;
    #
    # font = "FiraCode Nerd Font 12";
    #
    # # Posisi notifikasi
    # anchor = "top-right";
    #
    # # Timeout default (dalam milidetik)
    # defaultTimeout = 5000;
    #
    # icons = true;
    # iconPath = "${pkgs.papirus-icon-theme}/share/icons/Papirus";
    #
    # progress = true;
    # maxVisible = 3;
    # layer = "overlay";
    #
    # # Warna berdasarkan urgensi
    # extraConfig = ''
    #   [urgency=low]
    #   border-color=#8ccf7e
    #
    #   [urgency=normal]
    #   border-color=#e5c76b
    #
    #   [urgency=critical]
    #   border-color=#e57474
    # '';
  };
}
