{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # install package
  environment.systemPackages = with pkgs; [
    nextcloud-client
    python3
    tailscale
    android-studio
    intel-compute-runtime
    qemu_full
    virt-manager
    libusb1
    OVMF
    rar
    luarocks
    rustc
    cargo
    cifs-utils
    gvfs
    samba
    gnome-keyring
        libsecret
    seahorse # opsional, GUI
  ];

  # environment.plasma6.excludePackages = with pkgs; [
  #   kdePackages.konsole
  #   kdePackages.kate
  #   xterm
  # ];

  services.xserver.excludePackages = [ pkgs.xterm ];
  # # install docker
  # virtualisation.docker.enable = true;
  # users.extraGroups.docker.members = [ "abdyllaan" ];
  #
  # install qemu kvm
  # virtualisation.libvirtd = {
  #   enable = true;
  #   qemu = {
  #     ovmf.enable = true;
  #   };
  # };
  # users.extraGroups.libvirtd.members = [ "abdyllaan" ];

  # enable the tailscale service




  # programs.teamviewer = {
  #   enable = true;
  # };
  #


}
