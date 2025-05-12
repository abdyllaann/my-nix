{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    wpsoffice
    libwps
    libreoffice
  ]
  );

}
