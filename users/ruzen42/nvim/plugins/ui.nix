{ pkgs, ... }: 
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "cendre";
        src = pkgs.fetchFromGitHub {
          owner = "aejkatappaja";
          repo = "cendre";
          rev = "main"; 
          hash = "sha256-Zz4qQE1YFoKWnYi7KLhz/667TozSQz1lQYviPkL7Kqs="; 
        };
      })
    ];

    colorscheme = "cendre";

    extraConfigLua = ''
      vim.cmd([[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NormalFloat guibg=NONE ctermbg=NONE
        highlight NormalNC guibg=NONE ctermbg=NONE
        highlight SignColumn guibg=NONE ctermbg=NONE
      ]])
    '';

    plugins = {
      oil.enable = true;

      lualine.enable = true;

      aerial = {
        enable = true;
        settings = {
          layout = {
            default_direction = "right";
            placement = "window";
          };
          backends = [ "treesitter" "lsp" "markdown" "man" ];
          open_automatic = true;
          close_automatic_events = [
            "unsupported"
            "switch_buffer"
          ];
          highlight_on_hover = true;
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          auto_install = true;
          ensure_installed = "all";
        };
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

    keymaps = [
      {
        mode = "n";
        key = "<C-l>";
        action = "<CMD>vsplit | wincmd H | vertical resize 30 | Oil<CR>";
        options.desc = "Open Oil in a left sidebar";
      }
    ];
  };
}
