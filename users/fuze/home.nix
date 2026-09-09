{ pkgs, lib, ...}:
{
  home.username = "fuze";
  home.homeDirectory = lib.mkForce "/srv/users/fuze";

  imports = [ 
    ./nvim
    ./fonts
    ./tmux
  ];

  home.packages = with pkgs; [
    terminus_font
    terminus_font_ttf
    tmux
  ]; 

  programs.git.settings = {
    enable = true;
    userName = "ruzen42";
    userEmail = "malledeferlive@gmail.com";
  };
  
  home.file.".kshrc".source = ./ksh/kshrc;

  home.stateVersion = "26.05";
}
