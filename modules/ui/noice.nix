{ pkgs, ... }:
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.noice-nvim
      pkgs.vimPlugins.nui-nvim
      pkgs.vimPlugins.nvim-notify
    ];

    pluginRC.nvim-notify = ''
      require("notify").setup({
        background_colour = "#000000",
        stages = "fade_in_slide_out"
      })
    '';

    pluginRC.noice-nvim = ''
      local noice = require("noice")
      noice.setup({
        lsp = {
          progress = { enabled = true },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
        views = {
          cmdline_popup = {
            enabled = false,
          },
          popupmenu = {
            enabled = false,
          },
        },
      })
    '';
  };
}
