{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps  = [ "nikitabobko/tap" ];

    brews = [
      "fish"
      "git"
      "mas"
      "neovim"
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
      "element"
    ];

    masApps = {
      "Bitwarden" = 1352778147;
      "WhatsApp Messenger" = 310633997;
    };
  };
}
