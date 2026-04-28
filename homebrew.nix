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
      "ripgrep"
    ];

    casks = [
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "nikitabobko/tap/aerospace"
      "karabiner-elements"
      "google-chrome"
      "discord"
      "codex"
    ];

    masApps = {
      #"Bitwarden" = 1352778147;
    };
  };
}
