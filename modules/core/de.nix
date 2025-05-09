{
  services = {
    displayManager.sddm.enable = true;
    # desktopManager.cosmic.enable = true;
    desktopManager.plasma6.enable = true;
  };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
