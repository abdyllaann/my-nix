{ pkgs, inputs, system, ... }: {
  home.packages = with pkgs; [

    ## CLI Utilities
    tig
    fd
    ripgrep
    lsd
    neofetch
    tty-clock
    tree
    trash-cli
    wget
    unzip
    bottom
    nitch
    ttyper
    cmatrix
    sl
    wavemon
    wl-clipboard
    xdg-utils
    xxd
    woomer
    yt-dlp-light
    eza
    btop
    superfile
    ## Development Tools
    gcc
    gdb
    cmake
    gnumake
    nodejs_23
    yarn
    go
    gopls
    delve
    tmux
    devbox

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
    brave
    mpv
    filezilla
    blueman

    obs-studio
    viewnior
    winbox4
    # nautilus
    # nautilus-open-any-terminal
    ## Printer Support
    cups
    # gutenprint
    # epson-escpr
    # epson_201207w
    # epson-201401w

    ## System Tools
    fuse
    appimage-run
    nordic
    libnotify
    libsForQt5.kcalc
    xorg.xdm
    dconf

    #game
    pcsx2
    # lutris
    # wine
    # winetricks
    # protontricks

    ## Formatter (from input)
    #    inputs.alejandra.defaultPackage.${system}
  ];
}

