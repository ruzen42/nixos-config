{ inputs, ...}:
{
  imports = [ inputs.niri-flake.homeModules.niri ];

  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "swaybg" "-i" "/etc/nixos/walls/wall.jpg" ]; }
      { command = [ "mako" ]; }
      { command = [ "qs" ]; }
    ];

    input = {
      keyboard = {
        xkb = {
          layout = "us,ru";
          variant = "dvorak,";
          options = "grp:caps_toggle";
        };
        numlock = true;
      };
      focus-follows-mouse.enable = true;
    };

    gestures = {
      hot-corners.enable = false;
    };

    xwayland-satellite.enable = true;

    overview = {
      backdrop-color = "#1E2326";
      workspace-shadow.enable = true;
    };

    binds = {
      "Mod+Shift+G".action.spawn = [ "alacritty" ]; 
      "Mod+Shift+B".action.spawn = [ "chromium" ]; 
      "Mod+Shift+M".action.spawn = [ "AyuGram" ];
      "Mod+R".action.spawn = [ "fuzzel" ];
      "Mod+Shift+C".action.close-window = [];

      "Mod+F".action.maximize-column = [];

      "Mod+T".action.focus-column-left = [];
      "Mod+N".action.focus-column-right = [];

      "Mod+Shift+T".action.move-column-left = [];
      "Mod+Shift+N".action.move-column-right = [];
    
      "Mod+L".action.focus-workspace-up = [];
      "Mod+D".action.focus-workspace-down = [];

      "Shift+Mod+L".action.move-window-to-workspace-up = [];
      "Shift+Mod+D".action.move-window-to-workspace-down = [];

      "Mod+Shift+E".action.quit = [];
      "Mod+M".action.open-overview = [];
      "Print".action.screenshot = { show-pointer = false; };
    };
  
    prefer-no-csd = true;

    layout = {
      gaps = 2;
      center-focused-column = "never";
      default-column-width = { proportion = 0.5; };

      focus-ring = {
        width = 1;
        active.color = "#F75C7B";
        inactive.color = "#A20021";
      };
    };

    outputs."DP-2".mode = {
      height = 1080;
      width = 1920;
      refresh = 165.001;
    }; 

    window-rules = [
      {
        matches = [];
        geometry-corner-radius = {
          bottom-left = 2.0;
          bottom-right = 2.0;
          top-right = 2.0;
          top-left = 2.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
