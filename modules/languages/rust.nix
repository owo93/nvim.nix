{
  vim = {
    languages.rust = {
      enable = true;
      treesitter.enable = true;

      lsp = {
        enable = true;
      };

      format = {
        enable = true;
        type = [ "rustfmt" ];
      };
    };
  };
}
