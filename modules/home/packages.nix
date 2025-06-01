{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    ## CLI Utilities
    tig
    fd
    ripgrep
    lsd
    tty-clock
    tree
    trash-cli
    wget
    unzip
    bottom
    nitch
    ttyper
    wavemon
    wl-clipboard
    xdg-utils
    yt-dlp-light
    eza
    btop
    ani-cli
    microfetch
    tlrc
    hyperfine
    # yazi
    unrar
    p7zip
    unzip
    gnupg
    zip
    xz
    ## Development Tools
    gcc
    gdb
    gh
    cmake
    gnumake
    nodejs_24
    yarn
    go
    gopls
    delve
    tmux
    dig
    pnpm
    ## Python
    python3
    python-launcher
    python312Packages.ipython
    ## Java
    jre

    ## PHP / Laravel
    php84
    php84Packages.composer

    ## Terraform / AWS / K8s
    terraform
    awscli2
    kubectl
    eksctl
    postman
    ## Android / Mobile Dev
    android-tools
    scrcpy
    ## GUI Apps
    telegram-desktop
    zapzap
    vlc
    imv
    rustdesk-flutter
    # brave
    vivaldi
    filezilla
    blueman
    # nemo-with-extensions
    obs-studio
    winbox4
    ## Printer Support
    cups
    # gutenprint
    # epson-escpr
    # epson_201207w
    # epson-201401w

    ## System Tools
    # appimage-run
    # nordic
    libnotify
    libsForQt5.kcalc
    dconf
    putty
    #game
    pcsx2
    # lutris
    # wine
    # winetricks
    # protontricks

    #download manager
    # aria2
    varia
    # persepolis
    ## Formatter (from input)
    #    inputs.alejandra.defaultPackage.${system}
    # joplin-desktop
  ];
}
