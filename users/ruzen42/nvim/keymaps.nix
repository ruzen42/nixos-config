{ ... }: 
{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<space>";
      action = "<NOP>";
      options.silent = true;
    }
    {
      mode = [ "n" "v" "o" ];
      key = "t";
      action = "gj"; 
    }
    {
      mode = [ "n" "v" "o" ];
      key = "n";
      action = "gk";
    }
    {
      mode = [ "n" "v" "o" ];
      key = "s";
      action = "l";
    }

    {
      mode = "n";
      key = "j";
      action = "n";
    }
    {
      mode = "n";
      key = "J";
      action = "N";
    }
    {
      mode = [ "n" "v" ];
      key = "k";
      action = "t";
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>Oil<CR>";
      options = { silent = true; };
    }

    {
      mode = [ "n" "i" ];
      key = "<C-t>";
      action = "<cmd>ToggleTerm<CR>";
    }

    {
      mode = "t";
      key = "<Esc>";
      action = "[[<C-\><C-n>]]";
    } 
  ];
}
