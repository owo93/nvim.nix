{
  config.vim = {
    languages.nix = {
      enable = true;
      lsp = {
        enable = true;
        servers = [ "nixd" ];
      };
      treesitter.enable = true;
      format = {
        enable = true;
        type = [ "nixfmt" ];
      };
    };

  };
}
