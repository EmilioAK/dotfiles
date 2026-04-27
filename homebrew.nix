{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";  # "zap" later, once you trust the setup
    };

    taps  = [ ];

    brews = [
      "git"
      "neovim"
    ];

    casks = [
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "google-chrome"
      "codex"
    ];

    masApps = {
      # "Xcode" = 497799835;
    };
  };
}
