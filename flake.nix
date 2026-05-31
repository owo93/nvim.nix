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
    {
      flake-parts,
      import-tree,
      nvf,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.git-hooks.flakeModule
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
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
        { config, system, ... }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
          };

          nvimConfig = nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ (import-tree ./modules) ];
          };
        in
        {
          packages.default = nvimConfig.neovim;

          apps.default = {
            type = "app";
            program = "${nvimConfig.neovim}/bin/nvim";
            meta = {
              description = "owo93's neovim flake";
            };
          };

          formatter = pkgs.nixfmt;
          devShells.default = pkgs.mkShell {
            inputsFrom = [ config.pre-commit.devShell ];
            packages = with pkgs; [
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
