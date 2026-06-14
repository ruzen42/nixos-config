{ config, pkgs, ... }:
{
  environment.systemPackages = [
    warzone2100
  ];
  
  programs.steam.enable = true;
}
