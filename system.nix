{ lib, username, ... }:
let
  inherit (lib) escapeShellArg generators mkAfter;

  keyboardLayout = id: name: {
    InputSourceKind = "Keyboard Layout";
    "KeyboardLayout ID" = id;
    "KeyboardLayout Name" = name;
  };

  usLayout = keyboardLayout 0 "U.S.";
  swedishProLayout = keyboardLayout 7 "Swedish - Pro";

  # Seed Control Center's Vision Accessibility list with Color Filters.
  visionAccessibilityShortcutIds = [
    "com.apple.universalaccess.axDisplayFilterEnabled.toggle"
  ];

  writeByHostUserDefault = domain: key: value:
    let
      user = escapeShellArg username;
    in
    ''
      launchctl asuser "$(id -u -- ${user})" sudo --user=${user} -- defaults write ~${username}/Library/Preferences/ByHost/${domain} ${escapeShellArg key} ${escapeShellArg (generators.toPlist { escape = true; } value)}
    '';
in {
  system.primaryUser = username;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  nix.settings.experimental-features = "nix-command flakes";

  security.pam.services.sudo_local.touchIdAuth = true;

  # Bump only when `darwin-rebuild changelog` tells you to.
  system.stateVersion = 6;

  # macOS preference defaults — discover more in the nix-darwin manual.
  system.defaults = {
    CustomUserPreferences = {
      # Observed from System Settings after configuring Color Filters.
      "com.apple.mediaaccessibility" = {
        "__Color__-MADisplayFilterCategoryEnabled" = 0;
        "__Color__-MADisplayFilterType" = 16;
        MADisplayFilterSingleColorIntensity = 0.7100822925567627;
      };
      "com.apple.HIToolbox" = {
        AppleCurrentKeyboardLayoutInputSourceID = "com.apple.keylayout.US";
        AppleDefaultAsciiInputSource = usLayout;
        AppleEnabledInputSources = [ usLayout swedishProLayout ];
        AppleInputSourceHistory = [ usLayout swedishProLayout ];
        AppleSelectedInputSources = [ usLayout ];
      };
      "com.apple.TextInputMenu" = {
        visible = true;
      };
    };
    WindowManager = {
      GloballyEnabled = false;
      EnableStandardClickToShowDesktop = false;
      StandardHideWidgets = true;
      StageManagerHideWidgets = true;
    };
    dock = {
      autohide = true;
      expose-group-apps = true;
      mru-spaces = false;
      show-recents = false;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
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
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticInlinePredictionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };
  };

  system.activationScripts.postUserAccessibilityShortcuts.text = mkAfter ''
    echo >&2 "vision accessibility shortcuts..."
    ${writeByHostUserDefault
      "com.apple.controlcenter.visionaccessibility"
      "sortedShortcutIDs"
      visionAccessibilityShortcutIds}
  '';
}
