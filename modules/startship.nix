{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    # settings = builtins.fromTOML (builtins.readFile ./.dotfiles/startship/startship.toml);
    settings = {
      # builtins.fromTOML (builtins.readFile ./.dotfiles/startship/startship.toml);
      add_newline = true;
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "bold purple";
      };
      character = {
        success_symbol = "[ & ](bold green)";
        error_symbol = "[ & ](bold red)";
      };
      # username = {
      #   show_always = true;
      #   format = "[$user]($style)@";
      # };
      directory = {
        read_only = " 🔒";
        truncation_symbol = "…/";
      };
    };
  };
}
