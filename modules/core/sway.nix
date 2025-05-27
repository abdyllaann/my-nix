{ inputs, pkgs, ... }:

{
  programs.sway.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      sway.default = [ "gtk" ];
      common.default = [ "gtk" ];
    };
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}

