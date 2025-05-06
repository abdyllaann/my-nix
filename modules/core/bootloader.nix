{ ... }: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "Asia/Jakarta";
  boot.supportedFilesystems = [ "cifs" ];
}
