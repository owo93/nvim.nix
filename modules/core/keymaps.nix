{
  vim.keymaps = [
    # ── Telescope / File Finding ──
    {
      key = "<leader>ff";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files<CR>";
      desc = "Find files";
    }
    {
      key = "<leader>fp";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope projects<CR>";
      desc = "Find projects";
    }
    {
      key = "<leader>f/";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope live_grep<CR>";
      desc = "Live grep";
    }
    {
      key = "<leader>fk";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope keymaps<CR>";
      desc = "Find keymaps";
    }

    # ── Window Splits ──
    {
      key = "<leader>sv";
      mode = "n";
      silent = true;
      action = "<cmd>vsplit<CR>";
      desc = "Split vertically";
    }
    {
      key = "<leader>sh";
      mode = "n";
      silent = true;
      action = "<cmd>split<CR>";
      desc = "Split horizontally";
    }
    {
      key = "<leader>sq";
      mode = "n";
      silent = true;
      action = "<cmd>q<CR>";
      desc = "Close split";
    }

    # ── Buffer ──
    {
      key = "<leader>bd";
      mode = "n";
      silent = true;
      action = "<cmd>bd<CR>";
      desc = "Close buffer";
    }

    # ── Explorer ──
    {
      key = "<leader>e";
      mode = "n";
      silent = true;
      action = "<cmd>Neotree toggle<CR>";
      desc = "Toggle file explorer";
    }

    # ── Notifications (Noice) ──
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

    # ── QoL ──
    {
      key = "<Esc><Esc>";
      mode = [ "n" ];
      silent = true;
      action = "<cmd>nohl<CR>";
      desc = "Clear search highlights";
    }
  ];
}
