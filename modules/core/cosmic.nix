{ pkgs, self, ... }:
{
  services.displayManager.ly.enable = true;
  services.desktopManager.cosmic.enable = true;
  environment.excludePackages = with pkgs; [
    # cosmic-files
  ];

}
