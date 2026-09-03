{ ... }: 
{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-l>";
      action = "<CMD>Oil<CR>";
      options.desc = "Open Oil file manager";
    }
  ];

  programs.nixvim.plugins = {
    oil.enable = true;
    lualine.enable = true;

    codewindow = {
      enable = true;
      settings = {
        auto_enable = true; 
        window_side = "right"; 
      };
    };

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
  
  programs.nixvim.colorschemes.cendre = {
    enable = true;
    settings = {
      enable_italic = 1;
      transparent_background = 1;
    };
  };
}
