{pkgs, ...}:
{
  home.packages = with pkgs; [ swaylock-effects ];

  systemd.user.services.swayidle = {
    Unit = {
      Description = "Idle manager for Wayland";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = ''
        ${pkgs.swayidle}/bin/swayidle -w \
          timeout 8 '${pkgs.swaylock-effects}/bin/swaylock --effect-blur 7x5 --clock --indicator' \
          timeout 600 '${pkgs.sway}/bin/swaymsg "output * dpms off"' \
            resume '${pkgs.sway}/bin/swaymsg "output * dpms on"' \
          before-sleep '${pkgs.swaylock-effects}/bin/swaylock --effect-blur 7x5 --clock --indicator' \
          lock '${pkgs.swaylock-effects}/bin/swaylock --effect-blur 7x5 --clock --indicator'
      '';
      Restart = "always";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
