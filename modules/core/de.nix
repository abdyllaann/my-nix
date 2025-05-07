{ pkgs, self, ... }:
{
  services = {
    displayManager.ly.enable = true;
    desktopManager.cosmic.enable = true;
  };

}
