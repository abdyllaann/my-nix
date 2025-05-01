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
    pipes
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
    llvmPackages_20.clang-tools
    valgrind
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

    ## Fonts
    fira-code
    jetbrains-mono

    ## Networking / Remote Access
    teamviewer

    ## GUI Apps
    telegram-desktop
    zapzap
    brave
    github-desktop
    mpv
    discord
    audacity
    bleachbit
    filezilla
    gnome-disk-utility
    libreoffice
    ldtk
    tiled
    mission-center
    obs-studio
    pavucontrol
    pitivi
    soundwireserver
    thunderbird
    vlc
    zenity
    winetricks
    wineWowPackages.wayland

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
    inputs.alejandra.defaultPackage.${system}
  ];
}

