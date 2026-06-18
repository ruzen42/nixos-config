{ inputs, ...}:
{
  imports = [ inputs.niri-flake.homeModules.niri ];

  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "swaybg" "-i" "/etc/nixos/background.png" "-m" "fill" ]; }
      { command = [ "waybar" ]; }
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
      "Mod+Shift+T".action = { spawn = [ "alacritty" ]; };
      "Mod+Shift+C".action.close-window = [];

      "Mod+F".action.maximize-column = [];

      "Mod+R".action.spawn = [ "fuzzel" ];
      "Mod+T".action.focus-column-left = [];
      "Mod+N".action.focus-column-right = [];

      "Mod+Shift+T".action.move-column-left = [];
      "Mod+Shift+N".action.move-column-right = [];
    
      "Mod+L".action.focus-workspace-up = [];
      "Mod+D".action.focus-workspace-down = [];
      "Mod+Shift+E".action.quit = [];
      "Mod+M".action.open-overview = [];
      "Print".action.screenshot = { show-pointer = false; };
    };
  
    prefer-no-csd = true;

    layout = {
      gaps = 10;
      center-focused-column = "never";
      default-column-width = { proportion = 0.5; };

      focus-ring = {
        width = 3;
        active.color = "#A7C080";
        inactive.color = "#7A8478";
      };
    };

    outputs."DP-2".mode = {
      height = 1080;
      width = 1920;
      refresh = 165.001;
    }; 

    window-rules = [
      {
        match = [];
        geometry-corner-radius = 7;
        clip-to-geometry = true;
      }
    ];
  };
}
