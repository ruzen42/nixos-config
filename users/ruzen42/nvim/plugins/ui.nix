{ ... }: 
{
  programs.nixvim.plugins = {
    oil.enable = true;
    lualine.enable = true;
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
    };
  };
  
  programs.nixvim.colorschemes.everforest = {
    enable = true;
    settings = {
      background = "hard";
      enable_italic = 1;
      transparent_background = 1;
    };
  };
}
