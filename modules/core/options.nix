{
  vim = {
    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      autoindent = true;
      shiftwidth = 2;

      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = false;

      mouse = "nvi";
      cmdheight = 0;

      wrap = true;
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    luaConfigRC.fillchars = ''
      vim.opt.fillchars  = "eob: "
    '';
  };
}
