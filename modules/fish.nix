{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      nitch
      set fish_greeting      
      set -gx TERM xterm-256color
    '';
    shellAbbrs = {
      cat = "bat";
      ll = "lsd -l";
      la = "lsd -la";
      ls = "lsd";
      nhms = "nvim ~/nix/home.nix";
      ncns = "nvim ~/nix/configuration.nix";
      hms = "home-manager switch --flake ~/nix#abdyllaan";
      cns = "sudo nixos-rebuild switch --flake ~/nix#abdyllaan";
    };
    shellAliases = {
      c = "clear";
      spf = "superfile";
      nano = "nvim";
    };
  };
}

