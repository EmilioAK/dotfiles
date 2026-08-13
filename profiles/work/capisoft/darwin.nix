{ ... }: {
  homebrew = {
    taps = [
      { name = "netbirdio/tap"; trusted = true; }
    ];
    brews = [
      "netbirdio/tap/netbird"
    ];
    casks = [
      "docker-desktop"
      "netbirdio/tap/netbird-ui"
      "slack"
      "mactex-no-gui"
    ];
  };
}
