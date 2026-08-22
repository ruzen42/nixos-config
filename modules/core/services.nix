{ ... }:
{
	services.zfs.autoScrub.enable = true;
	services.zfs.autoSnapshot.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.archisteamfarm = {
    enable = true;
    web-ui.enable = true; 
  };
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };
  services.open-webui = {
    enable = true;
    port = 6768;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "False";
    };
  };
  services.pipewire = {
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
}
