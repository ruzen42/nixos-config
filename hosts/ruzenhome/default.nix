{ ... }:

{
  imports =
    [ 
      # Hardware and Disks
      ./hardware.nix
      ./disks.nix

      # Core Modules
      ../../modules/core
      ../../modules/core/services.nix
      ../../modules/hardware
      ../../modules/virtualisation

      # Desktop and Personal Modules
      ../../modules/desktop
      ../../modules/games
      ../../modules/bluetooth

      # User Configuration
      ../../users/ruzen42
    ];

  networking.hostName = "ruzenhome";

  system.stateVersion = "26.05"; 
}
