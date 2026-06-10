{ config, ...}:
{
  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    mirroredBoots = [
	    { devices = [ "nodev" ]; path = "/boot"; }
    ];
  };

  boot.loader.systemd-boot = {
    enable = false;
  };

  boot.zfs.extraPools = [ "storage" ];
  networking.hostId = "8425e349";
  boot.zfs.forceImportRoot = false;
}
