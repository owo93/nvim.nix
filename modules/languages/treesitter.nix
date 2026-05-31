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
    };
  };
}
