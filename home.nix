{ pkgs, config, username, ... }:
let
  flakeRoot = "${config.home.homeDirectory}/.config/nix-darwin";
  dotfile = path: config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/dotfiles/${path}";
in {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.file.".gitconfig".source = dotfile "gitconfig";
  xdg.configFile."ghostty/config".source = dotfile "ghostty/config";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
