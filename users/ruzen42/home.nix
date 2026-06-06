{ config, pkgs, ...}:
{
  home.username = "ruzen42";
  home.homeDirectory = "/home/ruzen42";

  home.packages = with pkgs; [
    niri
    waybar
    alacritty
    firefox
    discord
    telegram-desktop
    unityhub
    zsh
  ];

  programs.git = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };

  home.stateVersion = "26.05";

  xdg.configFile."niri/config.kdl".text = ''
    spawn-at-startup "swaybg" "-i" "/etc/nixos/background.jpg" "-m" "fill"
    spawn-at-startup "waybar" 
    
    input {
      keyboard {
        xkb {
          layout "us,ru"
          variant "dvorak,"
          options "grp:caps_toggle"
        }
      }
    }

    binds {
      "Mod+Swift+T" { spawn "alacritty"; }
      "Mod+Swift+C" { spawn "close-window"; }

      "Mod+R" { spawn "wofi"; }
      "Mod+Left" { focus-column-left; }
      "Mod+Right" { focus-column-right; }

      "Mod+Swift+Right" { move-column-right; }
      "Mod+Swift+Left" { move-column-left; }
      
      "Mod+U"   { focus-workspace-up;   }
      "Mod+D"   { focus-workspace-down; }
      "Mod+Swift+E" { quit; }

    }

    layout {
      gaps 8
      center-focused=column "never"
      default-column-width { proportion 0.5; }

      focus-ring {
        enable 
        width 2 
        active-color '#A7C080'
        inactive-color '#7A8478'
      }
    }


  '';
}
