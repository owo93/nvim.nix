{
  vim = {
    filetree = {
      neo-tree = {
        enable = true;
        setupOpts = {
          window = {
            position = "right";
          };
        };
      };
    };

    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>Neotree toggle<CR>";
        desc = "Toggle file explorer";
      }
    ];
  };
}
