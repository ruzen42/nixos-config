{ config, ... }: 
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;     
        pyright.enable = true;   
        gopls.enable = true;   
        rust_analyzer = {       
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        hls.enable = true;
      };
    };
    
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      settings.mapping = {
        "<Down>" = config.lib.nixvim.mkRaw ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" })
        '';
        "<Up>" = config.lib.nixvim.mkRaw ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" })
        '';

        "<Tab>" = config.lib.nixvim.mkRaw ''
          cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" })
        '';
      };
    };
 };
}
