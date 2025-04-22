{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./.dotfiles/startship/startship.toml);

  };
}
