{
  description = "My nvf neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    {
      flake-parts,
      import-tree,
      nvf,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
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
        { system, ... }:
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
              description = "launch nvf config";
            };
          };

          formatter = pkgs.nixfmt;
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixfmt
              nixd
            ];
          };
        };
    };
}
