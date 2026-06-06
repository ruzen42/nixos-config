{ config, lib, ... }:

{
  imports =
    [ 
      ./hardware.nix
      ../../modules/core
      ../../modules/desktop
      ../../modules/hardware
      ../../users/ruzen42
    ];

  networking.hostName = "ruzenhome";

  system.stateVersion = "26.05"; 
}

