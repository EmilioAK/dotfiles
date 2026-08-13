{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # Editor and language tooling
    neovim
    nil
    nixfmt
    statix
    pyright
    ruff

    # Shell and search
    antidote
    fd
    fzf
    nix-zsh-completions
    ripgrep

    # Version control
    git
    gh
    lazygit

    # Coding agents
    claude-code
    codex
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Misc
    fastfetch
    mosh
    nodejs
    tmux
  ];
}
