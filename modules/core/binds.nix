{
  vim.binds.whichKey = {
    enable = true;

    register = {
      "<leader>f" = "+Files";
      "<leader>s" = "+Splits";
      "<leader>b" = "+Buffers";
      "<leader>c" = "+Code";
      "<leader>e" = "+Explorer";
    };

    setupOpts = {
      preset = "modern";
      notify = true;
      win = {
        border = "rounded";
      };
    };
  };

  vim.vendoredKeymaps.enable = true;

  vim.ui.borders.plugins.which-key = {
    enable = true;
    style = "rounded";
  };
}
