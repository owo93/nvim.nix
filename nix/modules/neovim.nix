{ inputs, ... }:
let
  mkNeovim =
    pkgs:
    (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [ (inputs.import-tree ../../nvim) ];
    }).neovim;
in
{
  flake.modules.homeManager.default = { pkgs, ... }: {
    home.packages = [ (mkNeovim pkgs) ];
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.default = mkNeovim pkgs;

      apps.default = {
        type = "app";
        program = lib.getExe self'.packages.default;
      };
    };
}
