{ ... }:

{
  imports =
    [ 
      # Hardware and Disks
      ./hardware.nix
      ./disks.nix

      # Core Modules (Server/NoGui)
      ../../modules/core
      ../../modules/core/services.nix
      ../../modules/hardware
      ../../modules/virtualisation

      # User Configuration
      ../../users/fuze
    ];

  networking.hostName = "ruzenserver";

  system.stateVersion = "26.05"; 
}
