{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      nitch
      set fish_greeting      
      set -gx TERM xterm-256color
      tmux
    '';
    shellAbbrs = {
      cat = "bat";
      ll = "lsd -l";
      la = "lsd -la";
      ls = "lsd";
      nfz = "nvim (fzf)";
      cfz = "cd $(find . -type d | fzf)";
      nhms = "nvim ~/nix/home.nix";
      ncns = "nvim ~/nix/configuration.nix";
      hms = "home-manager switch --flake ~/nix#abdyllaan";
      cns = "sudo nixos-rebuild switch --flake ~/nix#abdyllaan";

      # tailscale
      tsu = "sudo tailscale up --accept-routes";
      tsd = "sudo tailscale down";

      #git
      gc = "git commit -m";
      gca = "git commit --amend -m";
      ga = "git add .";
    };
    shellAliases = {
      c = "clear";
      spf = "superfile";
      nano = "nvim";
      n = "nvim .";
      cd = "z";
      rm = "trash";
    };
  };
}

