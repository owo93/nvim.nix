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
  };
}
