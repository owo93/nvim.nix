_: {
  perSystem =
    {
      config,
      pkgs,
      self',
      ...
    }:
    {
      devShells.default = pkgs.mkShell {
        inputsFrom = [ config.pre-commit.devShell ];
        packages = [
          self'.packages.default
          pkgs.nixd
        ];
      };

      pre-commit = {
        check.enable = true;
        settings.hooks = {
          deadnix.enable = true;
          nixfmt.enable = true;
          statix.enable = true;
        };
      };
    };
}
