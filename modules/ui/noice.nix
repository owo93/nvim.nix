{
  vim = {
    ui.noice = {
      enable = true;
      setupOpts = {
        lsp = {
          progress.enabled = true;
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
          lsp_doc_border = true;
        };
        views = {
          cmdline_popup.enabled = false;
          popupmenu.enabled = false;
        };
      };
    };

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
