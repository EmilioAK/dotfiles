{ username, ... }: {
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  nix.settings.experimental-features = "nix-command flakes";

  # Bump only when `darwin-rebuild changelog` tells you to.
  system.stateVersion = 6;

  # macOS preference defaults — discover more in the nix-darwin manual.
  system.defaults = {
    dock = {
      autohide = true;
      mru-spaces = false;
      show-recents = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "clmv";  # column view
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 14;
      KeyRepeat = 2;
    };
  };
}
