{
  inputs,
  ...
}:
{
  imports = [
    inputs.git-hooks.flakeModule
    ./neovim.nix
    ./shell.nix
  ];
}
