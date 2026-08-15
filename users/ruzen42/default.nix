{ pkgs, ... }:
{
  users.users.ruzen42 = {
    isNormalUser = true;
    description = "ruzen42";
    extraGroups = [ 
      "wheel"
      "docker"
      "nixbld"
      "video"
      "networkmanager"
      "audio"
    ];
    shell = pkgs.ksh;
  };
}
