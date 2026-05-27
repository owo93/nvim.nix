{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haumea.url = "github:nix-community/haumea";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    inputs@{
      flake-parts,
      nvf,
      haumea,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs, ... }:
        let
          moduleTree = haumea.lib.load {
            src = ./modules;
          };

          collectModules =
            value:
            if builtins.isAttrs value then
              if value ? config then [ value ] else builtins.concatMap collectModules (builtins.attrValues value)
            else
              [ ];
        in
        {
          packages.default =
            (nvf.lib.neovimConfiguration {
              inherit pkgs;

              modules = [
                {
                  config.vim = {
                    theme = {
                      enable = true;
                      name = "solarized-osaka";
                      style = "dark";
                      transparent = true;
                    };
                    globals = {
                      mapleader = " ";
                    };
                    lsp = {
                      enable = true;
                      formatOnSave = true;
                    };

                    statusline.lualine = {
                      enable = true;
                      theme = "solarized_dark";
                    };

                    autocomplete.blink-cmp.enable = true;
                    telescope.enable = true;
                    binds.whichKey.enable = true;
                    vendoredKeymaps.enable = true;
                  };
                }
              ]
              ++ collectModules moduleTree;
            }).neovim;
        };
    };
}
