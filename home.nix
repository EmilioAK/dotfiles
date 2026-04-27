{ pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.file.".gitconfig".text = ''
    [user]
      name = EmilioAK
      email = me@emilioak.dev
  '';

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
