{ pkgs, ... }:
{
  vim.languages.rust = {
    enable = true;
    lsp.enable = false;
    extensions.rustaceanvim.enable = true;
  };

  vim.treesitter = {
    # Required for the `sql` injections below to be parsed
    grammars = [
      pkgs.vimPlugins.nvim-treesitter.grammarPlugins.sql
    ];

    queries = [
      {
        type = "injections";
        filetypes = [ "rust" ];
        loadtype = "extends";
        # https://www.reddit.com/r/neovim/comments/1rgmy9g/treesitter_sql_injections_in_rust/
        query = ''
          ; Highlight SQL in `query!()`, `query_unchecked!()`, `query_scalar!()`,
          ; and `query_scalar_unchecked!()`, whether imported directly or called
          ; as `sqlx::query!()`
          (macro_invocation
            macro: [
              (identifier) @_query
              (scoped_identifier
                path: (identifier) @_sqlx (#eq? @_sqlx "sqlx")
                name: (identifier) @_query)
            ]
            (#match? @_query "^query(_unchecked|_scalar|_scalar_unchecked)?$")
            (token_tree
              ; Only the first argument is SQL
              .
              [
                (string_literal (string_content) @injection.content)
                (raw_string_literal (string_content) @injection.content)
              ]
              )
            (#set! injection.language "sql"))

          ; Highlight SQL in `query_as!()` and `query_as_unchecked!()`,
          ; whether imported directly or called as `sqlx::query_as!()`
          (macro_invocation
            macro: [
              (identifier) @_query_as
              (scoped_identifier
                path: (identifier) @_sqlx (#eq? @_sqlx "sqlx")
                name: (identifier) @_query_as)
            ]
            (#match? @_query_as "^query_as(_unchecked)?$")
            (token_tree
              ; Only the second argument is SQL
              .
              ; Allow anything as the first argument in case the user has lower case type
              ; names for some reason
              (_)
              [
                (string_literal (string_content) @injection.content)
                (raw_string_literal (string_content) @injection.content)
              ]
              )
            (#set! injection.language "sql"))

          ; Highlight SQL in `query*` and `raw_sql` functions,
          ; whether imported directly or called as `sqlx::query*`
          (call_expression
            function: [
              (identifier) @_query_function
              (scoped_identifier
                path: (identifier) @_sqlx
                (#eq? @_sqlx "sqlx")
                name: (identifier) @_query_function)
            ]
            (#match? @_query_function "^query.*|raw_sql$")
            arguments: (arguments
              .
              [
                (string_literal
                  (string_content) @injection.content)
                (raw_string_literal
                  (string_content) @injection.content)
              ])
            (#set! injection.language "sql"))
        '';
      }
    ];
  };

}
