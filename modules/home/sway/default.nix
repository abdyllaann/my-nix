{ inputs, ... }:
{
  imports = [
    ./sway.nix
    ./swayidle.nix
    ./variable.nix
    ./swaylock.nix # lock screen
    # ./i3.nix
    # ./swaynag.nix
  ];
}
