{ ... }: 
{
  programs.nixvim.opts = {
    number = true;
    relativenumber = false;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    termguicolors = true;
  };
}
