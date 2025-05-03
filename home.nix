{ config, pkgs, ... }:

{


  home.username = "abdyllaan";
  home.homeDirectory = "/home/abdyllaan";
  programs.home-manager.enable = true;

  imports = [
    # ./modules/packages.nix
    # ./modules/git.nix
    # ./modules/neovim.nix
    # ./modules/startship.nix
    # ./modules/zoxide.nix
    # ./modules/fish.nix
    # ./modules/bat.nix
    ./home-packages
    # ./modules/tmux.nix
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.sessionVariables = {
    TERMINAL = "ghostty";
    TERM = "xterm-256color";
    EDITOR = "nvim";

  };

  home.file = { };



}
