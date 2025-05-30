{
programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 36;
      spacing = 10;
      margin = "0, 0, -10, 0";
      "modules-left" = [
        "custom/launcher"
        "sway/workspaces"
        "cava"
        "custom/recorder"
        "custom/audiorec"
        "custom/playerctl"
      ];
      "modules-center" = [ "mpd" ];
      "modules-right" = [
        "tray"
        "idle_inhibitor"
        "disk"
        "pulseaudio"
        "network"
        "battery"
        "clock"
        "custom/power"
      ];

      "sway/workspaces" = {
        format = "{name}";
        "format-icons" = {
          "1" = "󰈹";
          "2" = "󰓇";
          "3" = "󰓓";
          "5" = "󰆍";
          urgent = "󰈅";
          focused = "󰄯";
          default = "󰜋";
        };
        "window-rewrite-default" = "󰄯";
        "window-rewrite" = {
          "class<firefox>" = "󰈹";
          "class<alacritty>" = "󰆍";
          "class<spotify>" = "󰓇";
        };
      };

      "custom/playerctl" = {
        format = "{icon}  {text}";
        "return-type" = "json";
        "max-length" = 60;
        exec = ''
          playerctl metadata --format '{"text": "{{markup_escape(artist)}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F
        '';
        "on-click" = "playerctl play-pause";
        "on-scroll-up" = "playerctl volume .05+";
        "on-scroll-down" = "playerctl volume .05-";
        "format-icons" = {
          Playing = "<span>󰏥 </span>";
          Paused = "<span> </span>";
          Stopped = "<span> </span>";
        };
      };

      "custom/launcher" = {
        format = "";
        "on-click" = "exec wofi -c ~/.config/wofi/config -I";
        tooltip = false;
      };

      clock = {
        interval = 1;
        locale = "C";
        format = "  {:%a, %b %d 󰥔  %H:%M}";
        "format-alt" = "{:%H:%M}";
        tooltip = false;
      };

      cpu = {
        interval = 10;
        format = "  {usage}%";
        "max-length" = 10;
        "on-click" = "kitty -e 'htop'";
      };

      memory = {
        interval = 30;
        format = "  {used:0.2f}GB";
        "max-length" = 10;
        tooltip = false;
        warning = 70;
        critical = 90;
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon}   {capacity}%";
        "format-charging" = "⚡{capacity}%";
        "format-plugged" = "  {capacity}%";
        "format-icons" = [ "" "" "" "" "" ];
      };

      temperature = {
        "critical-threshold" = 80;
        "format-critical" = "{temperatureC}° ";
        format = "{temperatureC}° ";
      };

      network = {
        format = "{icon}  {bandwidthDownBits}";
        "format-alt" = "{ipaddr}/{cidr} {icon}";
        "format-alt-click" = "click-right";
        "format-wifi" = "{icon}  {bandwidthDownBits}";
        "format-icons" = {
          wifi = [ "󰤟" "󰤢" "󰤨" ];
          ethernet = [ "󰈀" ];
          disconnected = [ "󰅛" ];
        };
        "tooltip-format" = "{ifname}: {ipaddr}";
      };

      pulseaudio = {
        format = "{icon}  {volume}%";
        "format-bluetooth" = "{icon} {volume}%";
        "format-bluetooth-muted" = " ";
        "format-muted" = "  {format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = "";
        "format-icons" = {
          headphone = " ";
          "hands-free" = "";
          headset = "🎧";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        "on-click" = "pavucontrol";
      };

      backlight = {
        device = "intel_backlight";
        format = "{icon}  {percent}%";
        "format-icons" = [ "☀️" "" ];
        "on-scroll-down" = "brightnessctl -c backlight set 1%-";
        "on-scroll-up" = "brightnessctl -c backlight set +1%";
      };

      idle_inhibitor = {
        format = "{icon}";
        "format-icons" = {
          activated = "";
          deactivated = "";
        };
      };

      tray = {
        "icon-size" = 15;
      };

      disk = {
        format = "  {free}";
      };

      "custom/recorder" = {
        format = " Rec";
        "format-disabled" = " Off-air";
        "return-type" = "json";
        interval = 1;
        exec = ''echo '{"class": "recording"}' '';
        "exec-if" = "pgrep wf-recorder";
      };

      "custom/audiorec" = {
        format = "♬ Rec";
        "format-disabled" = "♬ Off-air";
        "return-type" = "json";
        interval = 1;
        exec = ''echo '{"class": "audio recording"}' '';
        "exec-if" = "pgrep ffmpeg";
      };

      mpd = {
        format = "{stateIcon} {artist} - {title}";
        "format-disconnected" = "🎶";
        "format-stopped" = "♪";
        interval = 10;
        "consume-icons" = {
          on = " ";
        };
        "random-icons" = {
          off = "<span color=\"#f53c3c\"></span> ";
          on = " ";
        };
        "repeat-icons" = {
          on = " ";
        };
        "single-icons" = {
          on = "1 ";
        };
        "state-icons" = {
          paused = "";
          playing = "";
        };
        "tooltip-format" = "MPD (connected)";
        "tooltip-format-disconnected" = "MPD (disconnected)";
        "max-length" = 45;
      };

      "custom/power" = {
        format = "";
        "on-click" = "exec ~/.config/scripts/power.sh";
        tooltip = false;
      };

      cava = {
        framerate = 60;
        autosens = 1;
        bars = 14;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        method = "pipewire";
        source = "auto";
        stereo = true;
        reverse = false;
        bar_delimiter = 0;
        monstercat = false;
        waves = false;
        noise_reduction = 0.77;
        input_delay = 2;
        "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        actions = {
          "on-click-right" = "mode";
        };
      };
    };
  };
          style = builtins.readFile ./waybar-fdd.css;
};

  }

