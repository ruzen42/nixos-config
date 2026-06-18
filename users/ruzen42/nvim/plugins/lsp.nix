{ ... }: 
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;     
        pyright.enable = true;   
        rust_analyzer = {       
          enable = true;
          installRustc = false;
          installCargo = false;
        };
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
    };
  };
}
