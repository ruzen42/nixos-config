{ config, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/system/main.nix
      ./modules/services.nix
      ./modules/nix.nix
    ];

  system.stateVersion = "26.05"; 
}

