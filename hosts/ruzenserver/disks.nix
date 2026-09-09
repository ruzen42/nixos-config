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

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0E6B-B50F";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/srv/users" =
    { device = "tank/srv/users";
      fsType = "zfs";
    };

  fileSystems."/srv" =
    { device = "tank/srv";
      fsType = "zfs";
    };

  fileSystems."/srv/gemini" =
    { device = "tank/srv/gemini";
      fsType = "zfs";
    };
}
