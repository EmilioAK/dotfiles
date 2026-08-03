{ config, ... }:
let
  flakeRoot = "${config.home.homeDirectory}/.config/nix-config";
  dotfile = path: config.lib.file.mkOutOfStoreSymlink "${flakeRoot}/dotfiles/${path}";
in
{
  home.file.".taskrc".source = dotfile "taskrc";
  home.file.".codex/task-manager".source = dotfile "codex/task-manager";
  home.file.".local/bin/claude-codex" = {
    source = dotfile "bin/claude-codex";
    force = true;
  };
  xdg.configFile."claude-code-proxy/config.json".source = dotfile "claude-code-proxy/config.json";
  xdg.configFile."ghostty/config".source = dotfile "ghostty/config";
  xdg.configFile."aerospace/aerospace.toml".source = dotfile "aerospace/aerospace.toml";
  xdg.configFile."karabiner/karabiner.json".source = dotfile "karabiner/karabiner.json";
}
