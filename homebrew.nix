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
      "ghostty"
      "google-chrome"
    ];

    masApps = {
      # "Xcode" = 497799835;
    };
  };
}
