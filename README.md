# Setup

1. Install Nix: <https://nix.dev/install-nix>
2. Install Homebrew: <https://docs.brew.sh/Installation.html>
3. Run:

```sh
mkdir -p ~/.config
git clone git@github.com:EmilioAK/dotfiles.git ~/.config/nix-darwin
cd ~/.config/nix-darwin
```

4. Run:

```sh
cat > local.nix <<EOF
{
  hostname = "$(scutil --get LocalHostName)";
  username = "$(id -un)";
  system = "$( [ "$(uname -m)" = arm64 ] && echo aarch64-darwin || echo x86_64-darwin )";
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
- It's normal to have to restart once and start over due to FileVault
