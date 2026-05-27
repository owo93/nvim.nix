{
  config.vim = {
    mini = {
      indentscope.enable = true;
      files.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0), true)<CR>";
        desc = "Open mini.files (Directory of Current File)";
      }
      {
        mode = "n";
        key = "<leader>E";
        action = "<cmd>lua require('mini.files').open(vim.uv.cwd(), true)<CR>";
        desc = "Open mini.files (cwd)";
      }
    ];
  };
}
