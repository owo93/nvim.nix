{ pkgs, ... }:
{
  vim = {
    extraPlugins.dial-nvim = {
      package = pkgs.vimPlugins.dial-nvim;
      setup = ''
        local augend = require("dial.augend")
        require("dial.config").augends:register_group{
          default = {
            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.constant.alias.bool,
          },
        }
      '';
    };

    keymaps = [
      {
        key = "<C-a>";
        mode = [
          "n"
          "v"
        ];
        action = "require('dial.map').inc_normal()";
        lua = true;
        desc = "Increment (dial.nvim)";
      }
      {
        key = "<C-x>";
        mode = [
          "n"
          "v"
        ];
        action = "require('dial.map').dec_normal()";
        lua = true;
        desc = "Decrement (dial.nvim)";
      }
    ];
  };
}
