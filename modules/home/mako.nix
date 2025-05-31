{ config, pkgs, ... }:

let
  makoConfig = ''
    anchor=top-right
    width=400
    height=200
    default_timeout=5000
    background-color=#141b1e
    text-color=#dadada
    border-color=#67b0e8
    border-size=2
    border-radius=12
    padding=10
    margin=10
    font=FiraCode Nerd Font 12
    format=<b>%s</b>\n%b
  '';
in
{
  home.packages = [ pkgs.mako ];

  # Tempatkan file config ke ~/.config/mako/config
  home.file.".config/mako/config".text = makoConfig;

  # Buat systemd service user untuk menjalankan mako
  systemd.user.services.mako = {
    Unit = {
      Description = "mako notification daemon";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.mako}/bin/mako";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

