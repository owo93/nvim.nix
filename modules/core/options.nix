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

      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      foldmethod = "expr";

      mouse = "nvi";
      cmdheight = 0;

      wrap = true;
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    luaConfigRC.fillchars = ''
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

      vim.opt.fillchars:append({ eob = " " })

      vim.diagnostic.config({ virtual_lines = true })
      vim.diagnostic.config({ virtual_text = true })
    '';
  };
}
