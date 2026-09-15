{ inputs, ... }:
{
  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.default =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [ (inputs.import-tree ../../nvim) ];
        }).neovim;

      apps.default = {
        type = "app";
        program = lib.getExe self'.packages.default;
      };
    };
}
