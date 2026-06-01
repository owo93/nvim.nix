{
  vim = {
    languages.nix = {
      enable = true;
      treesitter.enable = true;

      format = {
        enable = true;
        type = [ "nixfmt" ];
      };

      lsp = {
        enable = true;
        servers = [ "nixd" ];
      };
    };
  };
}
