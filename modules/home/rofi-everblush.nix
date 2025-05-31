{ pkgs, ... }:
{
  home.packages = with pkgs; [
  rofi-wayland
  rofi-network-manager
  rofimoji
  rofi-pulse-select
  rofi-bluetooth
  rofi-calc
  ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
      bg-col:        #141b1e;
      bg-col-light:  #232a2d;
      border-col:    #4b565c;
      selected-col:  #232a2d;
      red:           #e57474;
      green:         #8ccf7e;
      yellow:        #e5c76b;
      blue:          #67b0e8;
      magenta:       #c47fd5;
      cyan:          #6cbfbf;
      fg-col:        #dadada;
      fg-col2:       #ffffff;
      grey:          #4b565c;
      highlight:     @green;
    }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      modi: "run,drun";
      lines: 8;
      font: "Maple Mono Bold 16";
      show-icons: true;
      icon-theme: "Papirus-Dark";
      terminal: "foot";
      drun-display-format: "{icon} {name}";
      location: 0;
      sidebar-mode: true;
      sorting-method: "fzf";
      display-drun: " Apps ";
      display-run: " Run ";
    }

    @theme "theme"

    element-text, element-icon , mode-switcher {
      background-color: inherit;
      text-color: inherit;
    }

    window {
      height: 530px;
      width: 400px;
      border: 2px;
      border-color: @border-col;
      background-color: @bg-col;
    }

    mainbox {
      background-color: @bg-col;
    }

    inputbar {
      children: [prompt,entry];
      background-color: @bg-col-light;
      border-radius: 5px;
      padding: 0px;
    }

    prompt {
      background-color: @green;
      padding: 4px;
      text-color: @bg-col-light;
      border-radius: 3px;
      margin: 10px 0px 10px 10px;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    entry {
      padding: 6px;
      margin: 10px 10px 10px 5px;
      text-color: @fg-col;
      background-color: @bg-col;
      border-radius: 3px;
    }

    listview {
      padding: 6px 0px 0px;
      margin: 10px 0px 0px 6px;
      columns: 1;
      background-color: @bg-col;
    }

    element {
      padding: 8px;
      margin: 0px 10px 4px 4px;
      background-color: @bg-col;
      text-color: @fg-col;
    }

    element-icon {
      size: 28px;
    }

    element selected {
      background-color: @selected-col;
      text-color: @fg-col2;
      border-radius: 3px;
    }

    mode-switcher {
      spacing: 0;
    }

    button {
      padding: 10px;
      background-color: @bg-col-light;
      text-color: @grey;
      vertical-align: 0.5;
      horizontal-align: 0.5;
    }

    button selected {
      background-color: @bg-col;
      text-color: @green;
    }
  '';
  #
  #   # Tambahkan script power menu
  # home.file.".local/bin/powermenu".text = ''
  #   #!/usr/bin/env bash
  #   export ROFI_COMMAND=rofi-wayland
  #   rofi-power-menu --theme ~/.config/rofi/theme.rasi
  # '';
  # home.file.".local/bin/powermenu".executable = true;
}


