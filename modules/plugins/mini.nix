{
  vim = {
    mini = {
      files.enable = true;
      diff = {
        enable = true;
        setupOpts = {
          view = {
            style = "sign";
            signs = {
              add = "┃";
              change = "┃";
              delete = "_";
            };
          };
        };
      };
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
