# Setup

1. Install Nix: <https://nixos.org/download/>
2. Install Homebrew: <https://brew.sh/>
3. Run:

```sh
mkdir -p ~/.config
git clone https://github.com/EmilioAK/nix-darwin-config ~/.config/nix-darwin
cd ~/.config/nix-darwin
git remote set-url --push origin git@github.com:EmilioAK/nix-darwin-config.git
```

4. Run:

```sh
cat > local.nix <<EOF
{
  hostname = "$(scutil --get LocalHostName)";
  username = "$(id -un)";
  system = "$( [ "$(uname -m)" = arm64 ] && echo aarch64-darwin || echo x86_64-darwin )";
  workModules = [
    # Add tracked work modules here, for example an empty placeholder:
    # ./work/example.nix
  ];
}
EOF
```

5. Run:

```sh
sudo nix --extra-experimental-features "nix-command flakes" \
  run nix-darwin/nix-darwin-25.11#darwin-rebuild -- \
  switch --flake "path:$HOME/.config/nix-darwin#$(scutil --get LocalHostName)"
```

Notes:

- This repo expects to live at `~/.config/nix-darwin`
- `local.nix` is required and local-only, so the flake ref uses `path:`
- `local.nix` can opt into tracked modules from `work/` via `workModules`

Current limitations:

- Control Center layout is not tracked — macOS stores it in an opaque format and there's no supported way to set it declaratively
- Shortcuts automations are not tracked — personal automations are device-local and Apple does not sync them via iCloud, and Nix has no hook into the Shortcuts database
