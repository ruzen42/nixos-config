{ ... }:

{
  fileSystems."/" =
    { device = "tank/root";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "tank/nix";
      fsType = "zfs";
    };

  fileSystems."/var" =
    { device = "tank/var";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "tank/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0E6B-B50F";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
}
