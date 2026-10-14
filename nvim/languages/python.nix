_: {
  vim.languages.python = {
    enable = true;
    lsp.enable = true;
    lsp.servers = [ "ty" ];
    format.type = [ "ruff" ];
    extraDiagnostics.enable = false;
  };
}
