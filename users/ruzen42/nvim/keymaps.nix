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
      options.desc = "Вниз";
    }
    {
      mode = [ "n" "v" "o" ];
      key = "n";
      action = "gk";
      options.desc = "Вверх";
    }
    {
      mode = [ "n" "v" "o" ];
      key = "s";
      action = "l";
      options.desc = "Вправо";
    }

    {
      mode = "n";
      key = "j";
      action = "n";
      options.desc = "Следующее совпадение поиска";
    }
    {
      mode = "n";
      key = "J";
      action = "N";
      options.desc = "Предыдущее совпадение поиска";
    }
    {
      mode = [ "n" "v" ];
      key = "k";
      action = "t";
      options.desc = "До символа (до 't')";
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>Oil<CR>";
      options = {
        silent = true;
        desc = "Открыть текущий каталог в Oil";
      };
    }
  ];
}
