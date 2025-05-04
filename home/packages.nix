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
    toipe
    ttyper
    cbonsai
    cmatrix
    sl
    wavemon
    wl-clipboard
    xdg-utils
    xxd
    woomer
    yt-dlp-light

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


    ## Networking / Remote Access
    teamviewer

    ## GUI Apps
    alacritty
    telegram-desktop
    zapzap
    brave
    github-desktop
    mpv
    filezilla
    libreoffice
    mission-center
    obs-studio
    vlc

    ## Printer Support
    cups
    gutenprint
    epson-escpr
    epson_201207w
    # epson-201401w

    ## System Tools
    fuse
    appimage-run
    nordic
    libnotify
    libsForQt5.kcalc
    xorg.xdm

    ## Formatter (from input)
    #    inputs.alejandra.defaultPackage.${system}
  ];
}

