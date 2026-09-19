_: {
  vim = {
    notify.nvim-notify = {
      enable = true;
      setupOpts = {
        background_colour = "#000000";
        stages = "fade_in_slide_out";
        timeout = 1000;
      };
    };

    keymaps = [
      {
        key = "<leader>nn";
        mode = "n";
        silent = true;
        action = "<cmd>Noice dismiss<CR>";
        desc = "Dismiss notifications";
      }
      {
        key = "<leader>nt";
        mode = "n";
        silent = true;
        action = "<cmd>Noice last<CR>";
        desc = "Toggle last notification";
      }
      {
        key = "<leader>nl";
        mode = "n";
        silent = true;
        action = "<cmd>Noice telescope<CR>";
        desc = "Notification history";
      }
      {
        key = "<leader>na";
        mode = "n";
        silent = true;
        action = "<cmd>Noice all<CR>";
        desc = "View all notifications";
      }
    ];
  };
}
