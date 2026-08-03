{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [ "--force-cleanup" ];
    };

    taps = [
      "nikitabobko/tap"
      {
        name = "rjyo/moshi";
        trusted = true;
      }
      {
        name = "raine/claude-code-proxy";
        trusted = true;
      }
    ];

    brews = [
      "mas"
      {
        name = "rjyo/moshi/moshi-hook";
        restart_service = "changed";
      }
      {
        name = "raine/claude-code-proxy/claude-code-proxy";
        restart_service = "changed";
      }
    ];

    casks = [
      "ghostty"
      "nikitabobko/tap/aerospace"
      "karabiner-elements"
      "google-chrome"
      "microsoft-edge"
      # Codex desktop app; Homebrew retains the historical cask token.
      "chatgpt"
      "discord"
      "element"
      "visual-studio-code"
      "vlc"
      "trezor-suite"
      "obsidian"
    ];

    masApps = {
      "Bitwarden" = 1352778147;
      "WhatsApp Messenger" = 310633997;
      "Xcode" = 497799835;
    };
  };
}
