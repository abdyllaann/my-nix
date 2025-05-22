{ config, pkgs, ... }:

let
  show_file_or_dir_preview = ''
    if test -d {}; then
      eza --tree --color=always {} | head -200
    else
      bat --style=numbers --color=always {} || cat {}
    end
  '';
in
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Welcome prompt
      nitch
      set fish_greeting

      # Term setting for kitty
      if test "$TERM" = "xterm-kitty"
        set -x TERM xterm-256color
      end

      # Zoxide integration
      zoxide init fish | source

      # Set env
      set -x MICRO_TRUECOLOR 1
      set -x PATH /usr/local/bin $PATH

      # FZF integration helpers
      function __fzf_compgen_path
        fd --hidden --exclude .git . $argv
      end

      function __fzf_compgen_dir
        fd --type=d --hidden --exclude .git . $argv
      end

      function __fzf_comprun
        set command $argv[1]
        set args $argv[2..-1]

        switch $command
          case cd
            fzf --preview 'eza --tree --color=always {} | head -200' $args
          case ssh
            fzf --preview 'dig {}' $args
          case '*'
            fzf --preview '${show_file_or_dir_preview}' $args
        end
      end
    '';

    shellAbbrs = {
      # Navigation
      nfz = "nvim (fzf)";
      cfz = "cd (find . -type d | fzf)";
      nhms = "nvim ~/nix/home.nix";
      ncns = "nvim ~/nix/configuration.nix";
      hms = "home-manager switch --flake ~/nix#abdyllaan";
      cns = "sudo nixos-rebuild switch --flake ~/nix#abdyllaan";

      # Git
      gc = "git commit -m";
      gca = "git commit --amend -m";
      ga = "git add .";

      # Tailscale
      tsu = "sudo tailscale up --accept-routes";
      tsd = "sudo tailscale down";

      # File commands
      ll = "lsd -l";
      la = "lsd -la";
      ls = "lsd";
      cat = "bat";
    };

    shellAliases = {
      c = "clear";
      spf = "superfile";
      nano = "nvim";
      n = "nvim .";
      cd = "z";        # zoxide shortcut
      rm = "trash";    # safer delete
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}

