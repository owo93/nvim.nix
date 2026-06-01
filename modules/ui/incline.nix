{ pkgs, ... }:
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.incline-nvim
    ];

    pluginRC.incline = ''
      local helpers = require("incline.helpers")
      local devicons = require('nvim-web-devicons')
      local colors = require('solarized-osaka.colors').setup()

      require('incline').setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = colors.violet500 },
            InclineNormalNC = { guifg = colors.violet600, guibg = colors.base03 },
          },
        },
        window = {
          padding = 0,
          margin = { horizontal = 1, vertical = 0 },
        },

        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          
          local display_filename = filename
          if modified then
            display_filename = "[+] " .. filename
          end

          local icon_bg = ft_color or colors.magenta600 or "#e80045"
          local icon_fg = helpers.contrast_color(icon_bg)          

          return {
            ft_icon and { " ", ft_icon, " ", guibg = icon_bg, guifg = icon_fg } or " ",
            { " ", guibg = colors.base04 },
            { display_filename, gui = "bold", guibg = colors.base04 },
            { " ", guibg = colors.base04 },
          }
        end,
      })
    '';
  };
}
