{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  boot = {
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };

  powerManagement.cpuFreqGovernor = "performance";

  boot.zfs.extraPools = [ "storage" ];
  networking.hostId = "8425e349";
  boot.zfs.forceImportRoot = false;

  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.kernelParams = [ 
    "threadirqs"
    "preempt=full"            
    "amd_pstate=active"       
    "split_lock_detect=off"
    "usbcore.autosuspend=-1"    
    "zfs.zfs_arc_max=536870912"
    "zfs.zfs_arc_min=134217728"
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125; 
  };

  zramSwap = {
    memoryPercent = 100;
    algorithm = "zstd";
    enable = true;
  };
}
