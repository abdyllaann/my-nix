{ inputs, pkgs, ... }:

{
  imports = [
    ./sway
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
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./gtk.nix # gtk apps
    ./fonts.nix # gtk theme
    # ./hyprland # window manager
    ./kitty.nix # terminal
    ./ghostty.nix # terminal
    ./office.nix # browser
    ./lazygit.nix
    ./mpv.nix
    # ./obsidian.nix
    # ./tmux.nix
    # ./rofi.nix # launcher
    ./rofi-everblush.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./spicetify.nix # spotify client
    # ./swayosd.nix # brightness / volume wiget
    # ./swaync/swaync.nix # notification deamon
    ./waybar # status bar
    ./waypaper.nix # GUI wallpaper picker
    # ./xdg-mimes.nix # xdg config
    ./yazi.nix # terminal file manager
    # ./hyprlock.nix
  ];
}
