{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    ibm-plex
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "IBM Plex Mono" ];
      sansSerif = [ "IBM Plex Sans" ];
      serif = [ "IBM Plex Serif" ];
    };

  };

  console = {
    font = "Lat2-Terminus12";
    useXkbConfig = true;
  };
}
