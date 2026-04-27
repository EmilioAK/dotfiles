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
      "fish"
      "git"
      "neovim"
    ];

    casks = [
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "google-chrome"
      "discord"
      "codex"
      "claude-code"
    ];

    masApps = {
      #"Bitwarden" = 1352778147;
    };
  };
}
