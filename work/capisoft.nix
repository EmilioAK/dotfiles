{ username, ... }: {
  homebrew = {
    taps = [ "netbirdio/tap" ];
    casks = [
      "netbirdio/tap/netbird-ui"
      "slack"
    ];
  };

  home-manager.users.${username}.programs.ssh.matchBlocks."bitbucket.org" = {
    identityFile = "~/.ssh/id_ed25519_bitbucket";
    identitiesOnly = true;
  };
}
