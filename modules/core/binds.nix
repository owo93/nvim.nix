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
        "<leader>n" = "+Notifications";
        "<leader>h" = "+Git Hunk";
        "<leader>t" = "+Git";
      };

      setupOpts = {
        preset = "modern";
        notify = true;
        win = {
          border = "rounded";
          col = -1;
          width = {
            min = 24;
            max = 32;
          };
        };
      };
    };

    vendoredKeymaps.enable = true;

    ui.borders.plugins.which-key = {
      enable = true;
      style = "rounded";
    };

    keymaps = [
      # Splits
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

      # Buffer
      {
        key = "<leader>bd";
        mode = "n";
        silent = true;
        action = "<cmd>bd<CR>";
        desc = "Close buffer";
      }

      # Search
      {
        key = "<Esc><Esc>";
        mode = [ "n" ];
        silent = true;
        action = "<cmd>nohl<CR>";
        desc = "Clear search highlights";
      }

      # Move lines
      {
        key = "<A-j>";
        mode = [ "n" ];
        action = "<cmd>execute 'move .+' . v:count1<cr>==";
        desc = "Move Down";
      }
      {
        key = "<A-k>";
        mode = [ "n" ];
        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
        desc = "Move Up";
      }
      {
        key = "<A-j>";
        mode = [ "i" ];
        action = "<esc><cmd>m .+1<cr>==gi";
        desc = "Move Down";
      }
      {
        key = "<A-k>";
        mode = [ "i" ];
        action = "<esc><cmd>m .-2<cr>==gi";
        desc = "Move Up";
      }
      {
        key = "<A-j>";
        mode = [ "v" ];
        action = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
        desc = "Move Down";
      }
      {
        key = "<A-k>";
        mode = [ "v" ];
        action = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
        desc = "Move Up";
      }
    ];
  };
}
