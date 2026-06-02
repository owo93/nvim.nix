{ pkgs, ... }:
{
  vim = {
    telescope = {
      enable = true;

      extensions = [
        {
          name = "ui-select";
          packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
          setup = {
            "ui-select" = { };
          };
        }
      ];
    };

    keymaps = [
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
    ];
  };
}
