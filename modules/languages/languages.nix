let
  enabledLanguages = [
    "json"
    "lua"
    "markdown"
    "python"
    "typescript"
    "toml"
    "yaml"
  ];
in
{
  vim = {
    treesitter = {
      enable = true;
      fold = true;
      highlight.enable = true;
      addDefaultGrammars = true;

      indent.enable = true;

    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    }
    // (builtins.listToAttrs (
      map (lang: {
        name = lang;
        value = {
          enable = true;
          treesitter.enable = true;
          lsp.enable = true;
        };
      }) enabledLanguages
    ));
  };
}
