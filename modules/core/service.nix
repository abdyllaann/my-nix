{
  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      "workgroup" = "WORKGROUP";
      "security" = "user";
      "map to guest" = "Bad User";
    };

    shares = {
      home = {
        path = "/home/abdyllaan/Abdyllaan/share/";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "valid users" = "abdyllaan";
      };
    };
  };
}
