# Global Instructions

- Follow project-local instructions when present.

## Default writing style

- Read and apply the `simple-english` skill for all user-facing technical prose, including chat responses.
- Use pragmatic mode by default.
- If the user requests STE, ASD-STE100, or compliance, use strict mode.
- Keep code, identifiers, commands, paths, and quoted errors unchanged.
- Do not apply this style to marketing copy, blog content, or brand writing.

## Secrets and authentication

- Secrets are stored as env files under `~/.agents/secrets/`.
- `~/.pi/secrets/` is a compatibility symlink to `~/.agents/secrets/`.
- For tasks that might need credentials, API keys, tokens, cloud access, deploys, integrations, or external services, first check which files exist in `~/.agents/secrets/` and decide which env file may be relevant.
- Do not print or expose secret values. Prefer inspecting filenames/variable names, and source relevant env files only for the commands that need them.
- If any needed authentication is missing, expired, or invalid, stop and ask the user to re-authenticate instead of continuing with workarounds.
