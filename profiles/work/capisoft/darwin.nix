{ ... }: {
  homebrew = {
    taps = [
      { name = "netbirdio/tap"; trusted = true; }
    ];
    casks = [
      "docker"
      "netbirdio/tap/netbird-ui"
      "slack"
      "mactex-no-gui"
    ];
  };
}
