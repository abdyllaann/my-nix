{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
      extraPackages = with pkgs; [
        tree-sitter
    ];
  };
}

