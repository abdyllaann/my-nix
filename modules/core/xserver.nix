{
  pkgs,
  username,
  ...
}: {
  services = {
    xserver = {
      enable = false;
      xkb.layout = "us";
      videoDrivers = ["intel"];
    };

    # displayManager.autoLogin = {
    #   enable = true;
    #   user = "${username}";
    # };
    # libinput = {
    #   enable = true;
    # };
  };
  # To prevent getting stuck at shutdown
  # systemd.extraConfig = "DefaultTimeoutStopSec=10s";
  systemd.settings.Manager = {
    # DefaultTimeoutStartSec = "10s";
    DefaultTimeoutStopSec = "10s";
  };
}
