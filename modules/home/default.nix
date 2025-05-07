{ inputs, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./startship.nix
    ./zoxide.nix
    ./zsh
    ./browser.nix # firefox based browser
    ./cava.nix # audio visualizer
    ./discord/discord.nix # discord with gruvbox
    # ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    # ./gnome.nix # gnome apps
    ./gtk.nix # gtk apps
    ./fonts.nix # gtk theme
    ./hyprland # window manager
    ./kitty.nix # terminal
    ./nautilus.nix
    ./office.nix # browser
    #    ./lazygit.nix
    ./nemo.nix # file manager
    ./obsidian.nix
    # ./p10k/p10k.nix
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./spicetify.nix # spotify client
    ./swaylock.nix # lock screen
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./waybar # status bar
    ./waypaper.nix # GUI wallpaper picker
    # ./xdg-mimes.nix # xdg config
    ./yazi.nix # terminal file manager
    # ./monolisa
  ];
}
