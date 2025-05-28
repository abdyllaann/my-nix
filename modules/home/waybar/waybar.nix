{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["custom/cava"  "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "custom/mem" "custom/cpu" "battery" "network" "pulseaudio" "tray" "custom/power" ];

        "clock" = {
          format = "  {:%H:%M | %a, %d %b}";
        };

        "battery" = {
          format = "  {capacity}%";
          format-charging = "  {capacity}%";
          format-full = "  {capacity}%";
          format-low = "  {capacity}%";
          interval = 30;
        };

        "network" = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "  {ipaddr}";
          format-disconnected = "  Offline";
          interval = 10;
        };

        "pulseaudio" = {
          format = "  {volume}%";
          format-muted = "  Muted";
        };

        "custom/cava" = {
          exec = "tail -n 30 /tmp/cava.fifo";
          return-type = "raw";
          interval = 1;
          format = "{}";
          tooltip = false;
        };

        "custom/mem" = {
          exec = "free -h | awk '/Mem:/ { print \"  \" $3 \"/\" $2 }'";
          interval = 5;
          tooltip = true;
          on-click = "kitty -e btop";
        };

        "custom/cpu" = {
          exec = "top -bn1 | grep 'Cpu(s)' | awk '{ usage = $2 + $4; printf \"  %.1f%%\\n\", usage }'";
          interval = 5;
          tooltip = true;
          on-click = "kitty -e  btop";
        };

        "custom/power" = {
          format = "⏻";
          tooltip = true;
          on-click = "ROFI_COMMAND=rofi-wayland rofi-power-menu --no-symbols";
            # on-click = "rofi-power-menu --no-symbols";
        };
      };
    };

    style = ''
      * {
        font-family: Maple Mono, Font Awesome, sans-serif;
        font-size: 14px;
        border: none;
        border-radius: 0;
        padding: 0 10px;
        margin: 0;
      }

      window#waybar {
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #clock, #battery, #network, #pulseaudio, #tray, #custom-cava, #custom-power, #custom-mem, #custom-cpu {
        margin: 0 6px;
        padding: 4px 8px;
        background-color: #313244;
        border-radius: 6px;
      }

      #custom-power {
        background-color: #f38ba8;
        color: #1e1e2e;
      }
    '';
  };

  # Add cava config and create FIFO
  xdg.configFile."cava/config".text = ''
    [general]
    bars = 30

    [output]
    method = raw
    raw_target = /tmp/cava.fifo
    data_format = ascii
    bit_format = 8bit
    channels = mono
  '';

  systemd.user.services.cava-fifo = {
    Unit = {
      Description = "Cava visualizer to FIFO";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStartPre = "rm -f /tmp/cava.fifo && mkfifo /tmp/cava.fifo";
      ExecStart = "${pkgs.cava}/bin/cava -p $HOME/.config/cava/config";
      Restart = "always";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
}

