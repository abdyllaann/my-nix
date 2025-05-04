{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;




  # install package
  environment.systemPackages = with pkgs; [
    nextcloud-client
    obs-studio
    python3
    libreoffice
    tailscale
    winbox4
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
    git
    teamviewer
  ];

  # install docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "abdyllaan" ];

  programs.nix-ld.enable = true;

  # install qemu kvm
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
    };
  };
  users.extraGroups.libvirtd.members = [ "abdyllaan" ];

  # enable the tailscale service
  services.tailscale.enable = true;




  # programs.teamviewer = {
  #   enable = true;
  # };
  #


}
