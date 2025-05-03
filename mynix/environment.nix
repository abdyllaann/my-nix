{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.abdyllaan = {
  #   isNormalUser = true;
  #   shell = pkgs.zsh;
  #   description = "abdyllaan";
  #   extraGroups = [ "networkmanager" "wheel" ];
  #   packages = with pkgs; [
  #     # kdePackages.kate
  #     #  thunderbird
  #   ];
  # };


  # install package
  environment.systemPackages = with pkgs; [
    nextcloud-client
    obs-studio
    onlyoffice-desktopeditors
    python3
    libreoffice
    tailscale
    winbox4
    android-studio
    nordic
    intel-compute-runtime
    qemu_full
    virt-manager
    libusb1
    OVMF
    kdePackages.kdeconnect-kde
    rar
    # wpsoffice
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

  # enable fish
  programs.fish = {
    enable = true;

  };




  # programs.teamviewer = {
  #   enable = true;
  # };
  #


}
