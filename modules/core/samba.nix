{
  config,
  pkgs,
  ...
}: {
  services.samba = {
    enable = true;
    openFirewall = true;

    extraConfig = ''
      workgroup = WORKGROUP
      server string = Samba Server
      netbios name = NixOS
      security = user
      map to guest = Bad User
      guest account = nobody
    '';

    shares = {
      public = {
        path = "/home/abdyllaan/Abdyllaan/share";
        browseable = true;
        "read only" = true;
        "guest ok" = true;
        "create mask" = "0666";
        "directory mask" = "0777";
      };
    };
  };
}
