{ config, ... }:
let
  flakeRoot = "${config.home.homeDirectory}/.config/nix-config";
in {
  # Dotfiles are linked out of the store so agents and apps that rewrite their
  # own config at runtime keep working. Every module takes `dotfile` as an
  # argument instead of redefining this helper.
  _module.args.dotfile =
    path: config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/dotfiles/${path}";
  _module.args.flakeRoot = flakeRoot;
}
