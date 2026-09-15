{
  vim = {
    statusline = {
      lualine = {
        enable = true;
        theme = "auto";
        componentSeparator.left = "";
        componentSeparator.right = "";
        sectionSeparator = {
          left = "";
          right = "";
        };
        activeSection = {
          a = [
            ''{ "mode", separator = { left = "", right = "" }, right_padding = 4 }''
          ];
          b = [ ];
          y = [ "lsp_status" ];
          z = [
            ''{ "filetype", separator = { left = "", right = "" }, left_padding = 2 }''
          ];
        };
      };
    };
  };
}
