{ ... }:
{
	services = {
    zfs.autoScrub.enable = true;
	  zfs.autoSnapshot.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true; 
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    
      extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;  
          "default.clock.quantum" = 128;      
          "default.clock.min-quantum" = 64;  
          "default.clock.max-quantum" = 512;
        };
      };

      extraConfig.pipewire-pulse."92-low-latency" = {
        "pulse.properties" = {
          "pulse.min.req" = "64/48000";    
          "pulse.default.req" = "64/48000";
          "pulse.max.req" = "128/48000";
        };
      };
    };
    earlyoom = {
      enable = true;
      enableNotifications = true;
      freeMemThreshold = 4;
      freeSwapThreshold = 10;
      avoidPatterns = "^(niri|pipewire|wireplumber|dbus-daemon|systemd)$";
      preferPatterns = "^(steam)$";
    };
  };
}
