{ dotfile, ... }: {
  home.file.".tmux.conf".source = dotfile "tmux/tmux.conf";
}
