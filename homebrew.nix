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
    ];

    casks = [
      # "firefox"
      # "ghostty"
      # "raycast"
    ];

    masApps = {
      # "Xcode" = 497799835;
    };
  };
}
