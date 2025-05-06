{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./../modules/core
      ./../modules/lib/system-path.nix
    ];

  powerManagement.cpuFreqGovernor = "performance";

  # clock24h = true;
  # Select internationalisation properties.

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };
  # services.flatpak.enable = true;

  # # Enable CUPS to print documents.
  # services.printing.enable = true;
  #


  # security.pam.services.hyprlock = { };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # hardware.opengl = {
  #    enable = true;
  #    driSupport32Bit = true;
  #    extraPackages = with pkgs; [
  #        intel-compute-runtime
  #        rocmPackages.clr.icd
  #
  #    ];
  #  };
  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   plasma-browser-integration
  #   konsole
  #   oxygen
  # ];
  # Install firefox.
  # programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  # system.stateVersion = "24.11"; # Did you read the comment?
  # program.fish.enable = true;
  # nix.settings.auto-optimise-store = true;
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # nixpkgs.config.allowUnfree = true;


}
