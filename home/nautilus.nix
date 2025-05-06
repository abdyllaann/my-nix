{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus
    nautilus-open-any-terminal
    gvfs
    # gvfs-smb
  ];

  # Konfigurasi environment variable agar plugin dikenali
  home.sessionVariables = {
    GIO_EXTRA_MODULES = "${pkgs.glib-networking}/lib/gio/modules";
  };

  # Set default terminal untuk ekstensi
  home.sessionVariables = {
    # NAUTILUS_OPEN_ANY_TERMINAL_EMULATOR = "cosmic-term";
    NAUTILUS_OPEN_ANY_TERMINAL_EMULATOR = "gnome-terminal";
  };
}

