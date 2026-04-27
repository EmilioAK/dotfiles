{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";  # "zap" later, once you trust the setup
    };

    taps  = [ "nikitabobko/tap" ];

    brews = [
      "fish"
      "git"
      "neovim"
      "rg"
      "fd"
      "fzf"
      "lazygit"
      "node"
    ];

    casks = [
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "google-chrome"
      "discord"
      "codex"
      "claude-code"
      "nikitabobko/tap/aerospace"
      "karabiner-elements"
    ];

    masApps = {
      #"Bitwarden" = 1352778147;
    };
  };
}
