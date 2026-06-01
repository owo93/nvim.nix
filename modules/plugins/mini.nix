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
  };
}
