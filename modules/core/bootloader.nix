{ ... }: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 10;
  time.timeZone = "Asia/Jakarta";
  boot.supportedFilesystems = [ "cifs" ];
}
