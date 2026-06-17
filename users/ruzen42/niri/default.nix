{ inputs, config, ...}:
{
  imports = [
    inputs.niri-flake.homeModules.niri 
  ];

  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "swaybg" "-i" "/etc/nixos/background.png" "-m" "fill" ]; }
      { command = [ "waybar" ]; }
      { command = [ "elephant" ]; }
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
    };

  xwayland-satellite.enable = true;

  overview = {
    workspace-shadow.color = "#4F5B58";
  };

  binds = {
    "Mod+Shift+T".action.spawn = [ "alacritty" ];
    "Mod+Shift+C".action.close-window = [];

    "Mod+F".action.maximize-column = [];

    "Mod+R".action.spawn = [ "walker" ];
    "Mod+Left".action.focus-column-left = [];
    "Mod+Right".action.focus-column-right = [];

    "Mod+Shift+Right".action.move-column-right = [];
    "Mod+Shift+Left".action.move-column-left = [];
    
    "Mod+L".action.focus-workspace-up = [];
    "Mod+D".action.focus-workspace-down = [];
    "Mod+Shift+E".action.quit = [];
    "Mod+M".action.open-overview = [];
    "Print".action.screenshot = [];
  };
  
  prefer-no-csd = true;

  layout = {
    gaps = 8;
    center-focused-column = "never";
    default-column-width = { proportion = 0.5; };

    tab-indicator = {
      enable = true;
      corner-radius = 8;
    };

    focus-ring = {
      width = 2;
      active.color = "#A7C080";
      inactive.color = "#7A8478";
    };
  };

    outputs."DP-2".mode = {
      height = 1080;
      width = 1920;
      refresh = 165.001;
    }; 
  };
}
