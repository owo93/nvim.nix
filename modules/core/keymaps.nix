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

    # ── LSP ──
    {
      key = "K";
      mode = "n";
      silent = true;
      action = "<cmd>vim.lsp.buf.hover<CR>";
      desc = "Hover documentation";
    }
    {
      key = "gd";
      mode = "n";
      silent = true;
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      desc = "Go to definition";
    }
    {
      key = "<leader>ca";
      mode = [
        "n"
        "v"
      ];
      silent = true;
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      desc = "Code action";
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
  ];
}
