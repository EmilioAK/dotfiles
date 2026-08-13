{ config, lib, pkgs, hostname, dotfile, flakeRoot, ... }:
let
  # Hosts without an entry fall back to the shared default context.
  agentContextByHost = {
    nix-vps = "agents/AGENTS.vps.md";
  };
  agentContextFile =
    agentContextByHost.${hostname} or "agents/AGENTS.default.md";

  codexConfigByHost = {
    nix-vps = "codex/config.vps.toml";
    Emilios-MacBook-Pro = "codex/config.mac.toml";
  };
  codexConfigFile = codexConfigByHost.${hostname}
    or (throw "No Codex config declared for host ${hostname}");
in {
  home.file.".codex/AGENTS.md".source = dotfile agentContextFile;
  home.file.".codex/config.toml".source = dotfile codexConfigFile;
  home.file.".codex/hooks.json" = {
    source = dotfile "codex/hooks.json";
    force = true;
  };
  home.file.".codex/rules/default.rules".source = dotfile "codex/rules/default.rules";
  home.file.".codex/hooks/herdr-agent-state.sh" = {
    source = dotfile "codex/hooks/herdr-agent-state.sh";
    force = true;
  };

  # Claude Code atomically rewrites settings beside the symlink's immediate
  # target. Home Manager's normal store indirection makes that directory
  # read-only, so create a direct, writable out-of-store link instead.
  home.activation.linkClaudeSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    settingsPath=${lib.escapeShellArg "${config.home.homeDirectory}/.claude/settings.json"}
    sourcePath=${lib.escapeShellArg "${flakeRoot}/dotfiles/claude/settings.json"}
    run mkdir -p "$(${pkgs.coreutils}/bin/dirname "$settingsPath")"
    run rm -f "$settingsPath"
    run ln -s "$sourcePath" "$settingsPath"
  '';
  home.file.".claude/hooks/herdr-agent-state.sh" = {
    source = dotfile "claude/hooks/herdr-agent-state.sh";
    force = true;
  };
}
