{ pkgs, ... }: {
  # kernel xanmod
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.kernelParams = [ "tcp_congestion_control=bbr" ];
}
