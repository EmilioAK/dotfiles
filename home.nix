{ pkgs, config, username, hostname, ... }:
let
  flakeRoot = "${config.home.homeDirectory}/.config/nix-darwin";
  dotfile = path: config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/dotfiles/${path}";
in {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.file.".zprofile".source = dotfile "zprofile";
  home.file.".gitconfig".source = dotfile "gitconfig";
  xdg.configFile."git/ignore".source = dotfile "git/ignore";
  xdg.configFile."ghostty/config".source = dotfile "ghostty/config";
  xdg.configFile."fish/config.fish".source = dotfile "fish/config.fish";
  xdg.configFile."fish/conf.d/darwin-rebuild.fish".text = ''
    abbr --add --global drs "sudo darwin-rebuild switch --flake path:${flakeRoot}#${hostname}"
  '';
  xdg.configFile."aerospace/aerospace.toml".source = dotfile "aerospace/aerospace.toml";
  xdg.configFile."karabiner/karabiner.json".source = dotfile "karabiner/karabiner.json";
  xdg.configFile."nvim".source = dotfile "nvim";
}
