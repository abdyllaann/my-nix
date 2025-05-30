{ config, pkgs, ... }:
let
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
  in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = with custom;{
        height = 30;
        spacing = 4;
        position = "bottom";
        layer = "top";
        modules-left = [
          "sway/mode"
          "clock"
          "sway/scratchpad"
          "custom/media"
        ];

        modules-center = [
          # "sway/window"
          "sway/workspaces"
        ];

        modules-right = [
          "mpd"
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "bluetooth"
          "power-profiles-daemon"
          "cpu"
          "memory"
          # "temperature"
          "backlight"
          # "keyboard-state"
          # "sway/language"
          "battery"
          "battery#bat2"
          "tray"
          "custom/power"
        ];

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
          format-icons = [ "" "" ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
       "sway/workspaces" = {
          "disable-scroll" = true;
          "format" = "{icon}";
          "format-icons" = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          "urgent" = "";
          "focused" = "";
          "default" = "";
         };
          "on-click" = "swaymsg workspace number {id}";
        };

        "mpd" = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
           format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons.on = " ";
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons.on = " ";
          single-icons.on = "1 ";
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };

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
          # # format = "It's {:%A} | {:%Y-%m-%d} | {:%H:%M}";
          # tooltip-format = "<big>{:%A, %d %B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          # format-alt = "It's {:%A} | {:%Y-%m-%d} | {:%H:%M}";
          # tooltip-format = "<big>it's {:%Y %B} | {:%Y-%m-%d}</big>\n<tt><small>{calendar}</small></tt>";
          # format-alt = "it's {}";
          "interval" = 1;
          "format" = "It's {:%A, %d %b %H:%M:%S}";
        };
        bluetooth = {
          format = " {status}";
          tooltip = true;
          on-click = "bluez";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias} ({controller_address})";
          tooltip-format-connected = "{controller_alias} ({controller_address})\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias} ({device_address})";
          tooltip-format-enumerate-connected-battery = "{device_alias} ({device_address}) {device_battery_percentage}%";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory.format = "{}% ";

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        "battery#bat2".bat = "BAT2";

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };
        network = {
          format-wifi = " {signalStrength}%";
          format-ethernet = "󰈀 ";
          format-disconnected = "󰖪 Offline";
          tooltip-format = "{essid} ({signalStrength}%)\nIP: {ipaddr}\nInterface: {ifname}";
          on-click = "kitty -e nmtui";
          on-click-right = "kitty -e nmtui";
        };
        # network = {
        #   format-wifi = "{essid} ({signalStrength}%) ";
        #   format-ethernet = "{ipaddr}/{cidr} ";
        #   tooltip-format = "{ifname} via {gwaddr} ";
        #   format-linked = "{ifname} (No IP) ";
        #   format-disconnected = "Disconnected ⚠";
        #   # format-alt = "{ifname}: {ipaddr}/{cidr}";
        # };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "<span foreground='${white}'> </span> {volume}%";
          format-icons = {
            default = [ "<span foreground='${white}'> </span>" ];
          };
          scroll-step = 2;
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
        };
        # pulseaudio = {
        #   format = "{volume}% {icon} {format_source}";
        #   format-bluetooth = "{volume}% {icon} {format_source}";
        #   format-bluetooth-muted = " {icon} {format_source}";
        #   format-muted = " {format_source}";
        #   format-source = "{volume}% ";
        #   format-source-muted = "";
        #   format-icons = {
        #     headphone = "";
        #     hands-free = "";
        #     headset = "";
        #     phone = "";
        #     portable = "";
        #     car = "";
        #     default = [ "" "" "" ];
        #   };
        #   on-click = "pavucontrol";
        # };

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

