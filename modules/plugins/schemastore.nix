{ pkgs, ... }:
{
  vim = {
    extraPlugins.SchemaStore = {
      package = pkgs.vimPlugins.SchemaStore-nvim;
      setup = "";
    };
  };
}
