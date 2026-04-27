{ username, ... }: {
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  nix.settings.experimental-features = "nix-command flakes";

  # Generate /etc/fish/conf.d integration for Nix env while still allowing
  # Homebrew fish to be the interactive shell binary.
  programs.fish.enable = true;
  programs.fish.useBabelfish = true;

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
