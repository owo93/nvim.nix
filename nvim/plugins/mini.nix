{
  vim = {
    mini = {
      files.enable = true;
    };

    keymaps = [
      {
        key = "<leader>fm";
        mode = "n";
        silent = true;
        action = "<cmd>lua MiniFiles.open()<CR>";
        desc = "Toggle mini.files";
      }
    ];
  };
}
