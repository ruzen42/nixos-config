{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.ksh}/bin/ksh"; 
    terminal = "tmux-256color";
    historyLimit = 10000;
    keyMode = "vi";               
    mouse = true;                
    shortcut = "a";             

    extraConfig = ''
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      set -as terminal-features ",xterm-256color:RGB"
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      {
        plugin = minimal-tmux-status;
        extraConfig = ''
          set -g @minimal-tmux-fg "#F75C7B" 
          set -g @minimal-tmux-bg "#710117" 
        '';
      }
    ];
  };
}
