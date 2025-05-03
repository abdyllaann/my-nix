{ pkgs, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.abdyllaan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "abdyllaan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # kdePackages.kate
      #  thunderbird
    ];
  };

  programs.zsh = {
    enable = true;

  };
}
