{
  config,
  pkgs,
  ...
}: let
  custom = {
    font = "Maple Mono";
    font_size = "14px";
    font_weight = "bold";
    text_color = "#FBF1C7";
    background_0 = "#1D2021";
    background_1 = "#282828";
    border_color = "#928374";
    red = "#CC241D";
    green = "#98971A";
    yellow = "#FABD2F";
    blue = "#458588";
    white = "#ffffff";
    magenta = "#B16286";
    cyan = "#689D6A";
    orange = "#D65D0E";
    opacity = "1";
    indicator_height = "2px";
  };
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = with custom; {
        height = 30;
        spacing = 4;
        position = "bottom";
        layer = "top";
        modules-left = [
          "sway/mode"
          "clock"
          "cava"
          "sway/scratchpad"
          # "custom/media"
        ];

        modules-center = [
          # "sway/window"
          "sway/workspaces"
        ];

        modules-right = [
          # "mpd
          "tray"
          "idle_inhibitor"
          "network"
          # "bluetooth"
          # "power-profiles-daemon"
          "cpu"
          "memory"
          # "temperature"
          "pulseaudio"
          "backlight"
          # "keyboard-state"
          # "sway/language"
          "battery"
          "custom/launcher"
        ];

        "custom/launcher" = {
          format = "";
          "on-click" = "exec rofi -show drun";
          tooltip = false;
        };

        "keyboard-state" = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };

        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = ["" ""];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };

        "sway/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            # default = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            # active = "󱓻";
          };
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
        };

        # "mpd" = {
        #   format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
        #   format-disconnected = "Disconnected ";
        #    format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
        #   unknown-tag = "N/A";
        #   interval = 5;
        #   consume-icons.on = " ";
        #   random-icons = {
        #     off = "<span color=\"#f53c3c\"></span> ";
        #     on = " ";
        #   };
        #   repeat-icons.on = " ";
        #   single-icons.on = "1 ";
        #   state-icons = {
        #     paused = "";
        #     playing = "";
        #   };
        #   tooltip-format = "MPD (connected)";
        #   tooltip-format-disconnected = "MPD (disconnected)";
        # };
        #
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        tray = {
          spacing = 10;
        };

        clock = {
          "interval" = 1;
          "format" = "It's {:%A, %d %b %H:%M:%S}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
          on-click-right = "foot -e  btop";
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}   {capacity}%";
          "format-charging" = "⚡{capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-icons" = ["" "" "" "" ""];
        };
        # battery = {
        #   states = {
        #     warning = 30;
        #     critical = 15;
        #   };
        #   format = "{capacity}% {icon}";
        #   format-full = "{capacity}% {icon}";
        #   format-charging = "{capacity}% ";
        #   format-plugged = "{capacity}% ";
        #   format-alt = "{time} {icon}";
        #   format-icons = [ "" "" "" "" "" ];
        # };
        #
        # "battery#bat2".bat = "BAT2";
        #
        # "power-profiles-daemon" = {
        #   format = "{icon}";
        #   tooltip-format = "Power profile: {profile}\nDriver: {driver}";
        #   tooltip = true;
        #   format-icons = {
        #     default = "";
        #     performance = "";
        #     balanced = "";
        #     "power-saver" = "";
        #   };
        # };
        network = {
          interval = 1;
          format = "{icon}  {bandwidthDownBits}";
          "format-alt" = "{ipaddr}/{cidr} {icon}";
          "format-alt-click" = "click-left";
          "format-wifi" = "{icon}  {bandwidthDownBits}";
          "format-icons" = {
            wifi = ["󰤟" "󰤢" "󰤨"];
            ethernet = ["󰈀"];
            disconnected = ["󰅛"];
          };
          tooltip-format = "{essid} ({signalStrength}%)\nIP: {ipaddr}\nInterface: {ifname}";
          on-click-right = "rofi-network-manager";
        };
        # network = {
        #   format-wifi = "{essid} ({signalStrength}%) ";
        #   format-ethernet = "{ipaddr}/{cidr} ";
        #   tooltip-format = "{ifname} via {gwaddr} ";
        #   format-linked = "{ifname} (No IP) ";
        #   format-disconnected = "Disconnected ⚠";
        #   # format-alt = "{ifname}: {ipaddr}/{cidr}";
        # };
        # pulseaudio = {
        #   format = "{icon} {volume}%";
        #   format-muted = "<span foreground='${white}'> </span> {volume}%";
        #   format-icons = {
        #     default = [ "<span foreground='${white}'> </span>" ];
        #   };
        #   scroll-step = 2;
        #   on-click = "pamixer -t";
        #   on-click-right = "pavuconl";
        # };
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
            default = ["" "" ""];
          };
          "on-click" = "rofi-audio";
          on-click-right = "swaymsg exec pavucontrol && swaymsg [app_id=pavucontrol] floating enable";
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
          "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          actions = {
            "on-click-right" = "mode";
          };
        };

        "custom/media" = {
          format = "{icon} {text}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };

        # "custom/power" = {
        #   format = "⏻ ";
        #   tooltip = false;
        #   menu = "on-click";
        #   menu-file = "$HOME/.config/waybar/power_menu.xml";
        #   menu-actions = {
        #     shutdown = "shutdown";
        #     reboot = "reboot";
        #     suspend = "systemctl suspend";
        #     hibernate = "systemctl hibernate";
        #   };
        # };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
