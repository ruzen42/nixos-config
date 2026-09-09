{ pkgs, ... }:
{
  users.users.fuze = {
    isNormalUser = true;
    description = "fuze";
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
