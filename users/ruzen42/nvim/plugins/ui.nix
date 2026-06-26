{ ... }: 
{
  programs.nixvim.plugins = {
    oil.enable = true;
    lualine.enable = true;
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
    };
    toggleterm = {
      enable = true;
      settings = {
        direction = "horizontal"; 
        size = 15;
        start_in_insert = true;
        insert_mappings = true;
        terminal_mappings = true;
      };
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
