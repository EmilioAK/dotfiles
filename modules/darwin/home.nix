{ dotfile, ... }: {
  xdg.configFile."ghostty/config".source = dotfile "ghostty/config";
  xdg.configFile."aerospace/aerospace.toml".source = dotfile "aerospace/aerospace.toml";
  xdg.configFile."karabiner/karabiner.json".source = dotfile "karabiner/karabiner.json";
}
