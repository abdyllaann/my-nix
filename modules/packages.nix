{ pkgs, ... }: {
  home.packages = with pkgs; [
    tig
    fd
    ripgrep
    neofetch
    telegram-desktop
    superfile
    lsd
    gcc
    nodejs_23
    unzip
    fuse
    appimage-run
    android-tools
    warp-terminal
    cava
    zapzap
    ghostty
    fira-code
    brave
    github-desktop
    mpv
    wget
    nitch
    bottom
    jetbrains-mono
    wl-clipboard
    nordic
    tree
    trash-cli
    discord
    scrcpy
    #python
    python-launcher
    teamviewer
    #laravel
    php84
    php84Packages.composer
    yarn
    cups
    gutenprint
    epson-escpr
    tty-clock
    #golang
    tmux
    go
    gopls
    delve
    xorg.xdm
    jre
    terraform
    awscli2

    # kubernetes
    kubectl
    minikube
    eksctl
    postman


    # # hyprland stuff
    # libsForQt5.xwaylandvideobridge
    # libnotify
    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-hyprland
    # swayimg

    # other stuff
    libsForQt5.kcalc

  ];
}
