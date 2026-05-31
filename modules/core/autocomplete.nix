{
  vim = {
    autocomplete.blink-cmp = {
      enable = true;

      mappings = {
        complete = "<C-Space>";
        confirm = "<CR>";
        next = "<C-n>";
        previous = "<C-p>";
      };

      sourcePlugins = { };

      setupOpts = {
        signature = {
          enabled = true;
          trigger = {
            enabled = true;
          };
          window = {
            border = "rounded";
          };
        };

        sources = {
          default = [
            "lsp"
            "snippets"
            "path"
            "buffer"
          ];

          providers = {
            lsp = {
              score_offset = 10;
            };
            snippets = {
              score_offset = 4;
            };
            path = {
              score_offset = 3;
            };
            buffer = {
              score_offset = 1;
            };
          };
        };

        cmdline.keymap.preset = "none";

        completion = {
          menu = {
            auto_show = true;
            border = "rounded";
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };
        };
      };
    };
  };
}
