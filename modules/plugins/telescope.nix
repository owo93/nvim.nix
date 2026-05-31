{ pkgs, ... }:
{
  config.vim = {
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
  };
}
