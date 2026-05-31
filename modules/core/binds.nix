{
  vim = {
    binds.whichKey = {
      enable = true;

      register = {
        "<leader>f" = "+Files";
        "<leader>s" = "+Splits";
        "<leader>b" = "+Buffers";
        "<leader>c" = "+Code";
        "<leader>e" = "+Explorer";
        "<leader>l" = "+LSP";
      };

      setupOpts = {
        preset = "modern";
        notify = true;
        win = {
          border = "rounded";
        };
      };
    };

    vendoredKeymaps.enable = true;

    ui.borders.plugins.which-key = {
      enable = true;
      style = "rounded";
    };
  };
}
