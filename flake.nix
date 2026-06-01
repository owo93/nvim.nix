{
  description = "owo93's neovim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nvf.url = "github:notashelf/nvf";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    inputs@{
      flake-parts,
      import-tree,
      nvf,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      flake = {
        homeModules.default =
          { pkgs, ... }:
          {
            home.packages = [
              (nvf.lib.neovimConfiguration {
                inherit pkgs;
                modules = [ (import-tree ./modules) ];
              }).neovim
            ];
          };
      };

      perSystem =
        {
          pkgs,
          config,
          self',
          ...
        }:
        let
          nvimConfig = nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ (import-tree ./modules) ];
          };
        in
        {
          packages = {
            nvim = nvimConfig.neovim;
            default = self'.packages.nvim;
          };

          apps = {
            nvim = {
              type = "app";
              program = "${self'.packages.default}/bin/nvim";
            };
            default = self'.apps.nvim;
          };

          formatter = pkgs.nixfmt;
          devShells.default = pkgs.mkShell {
            inputsFrom = [ config.pre-commit.devShell ];
            packages = with pkgs; [
              self'.packages.default

              nixfmt
              nixd
              deadnix
              statix
            ];
          };

          pre-commit = {
            check.enable = true;
            settings = {
              hooks = {
                deadnix.enable = true;
                nixfmt.enable = true;
                statix.enable = true;
              };
            };
          };
        };
    };
}
