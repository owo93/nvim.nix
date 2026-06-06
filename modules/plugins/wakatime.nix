{ pkgs, ... }:
{
  vim = {
    extraPlugins = {
      vim-wakatime = {
        package = pkgs.vimPlugins.vim-wakatime;
      };
    };
  };
}
