# { pkgs
# , inputs
# , username
# , host
# , ...
# }: {
#
#   # Define a user account. Don't forget to set a password with ‘passwd’.
#   users.users.abdyllaan = {
#     isNormalUser = true;
#     shell = pkgs.fish;
#     description = "abdyllaan";
#     extraGroups = [ "networkmanager" "wheel" ];
#     packages = with pkgs; [
#       # kdePackages.kate
#       #  thunderbird
#     ];
#   };
#
#   programs.zsh = {
#     enable = true;
#
#   };
#
#   # enable fish
#   programs.fish = {
#     enable = true;
#
#   };
#
#
# }
#
#

{ pkgs
, inputs
, username
, host
, ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports =

        [ ./../home ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
