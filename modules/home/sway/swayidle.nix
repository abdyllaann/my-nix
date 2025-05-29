{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swayidle
    # swaylock
  ];

  systemd.user.services.swayidle = {
    Unit = {
      Description = "Idle manager for Wayland";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = ''
        ${pkgs.swayidle}/bin/swayidle -w \
          timeout 300 '${pkgs.swaylock}/bin/swaylock -f' \
          timeout 600 '${pkgs.sway}/bin/swaymsg "output * dpms off"' \
          resume '${pkgs.sway}/bin/swaymsg "output * dpms on"' \
          before-sleep '${pkgs.swaylock}/bin/swaylock -f'
      '';
      Restart = "always";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
