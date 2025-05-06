{ pkgs, host, ... }:
{
  networking = {
    hostName = "killua";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall.allowedTCPPorts = [ 21115 21116 21117 21118 21119 ];
    firewall.allowedUDPPorts = [ 21116 21117 21118 21119 ];
    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [
    #     22
    #     80
    #     443
    #     59010
    #     59011
    #   ];
    #   allowedUDPPorts = [
    #     59010
    #     59011
    #   ];
    # };
  };
  services.tailscale.enable = true;

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
