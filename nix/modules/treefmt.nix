{
  perSystem =
    { config, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };

        settings.formatter = {
          nixfmt.includes = [ "**/*.nix" ];
          deadnix.includes = [ "**/*.nix" ];
          statix.includes = [ "**/*.nix" ];
        };
      };

      formatter = config.treefmt.build.wrapper;
    };
}
