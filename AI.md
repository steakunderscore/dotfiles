# Workspace & AI Guidance

This repository is a **Chezmoi** dotfile repository. It contains configuration files and scripts managed by Chezmoi to be deployed to the user's home directory.

## Repository Structure

The following is an overview of the key files and folders in this workspace:

### Chezmoi Configuration & Scripts
- `.chezmoiignore`: Specifies files/patterns to be ignored by Chezmoi during deployment (e.g., this file and its symlinks).
- `.chezmoiscripts/`: Custom deployment and lifecycle scripts:
  - `run_onchange_after_chezmoi-completions.sh.tmpl`: Generates shell completions for Chezmoi.
  - `run_onchange_after_zellij-completions.sh.tmpl`: Generates shell completions for Zellij.
  - `run_onchange_build-utilities.sh.tmpl`: Automatically builds local Go utilities when source files change.

### Managed Dotfiles
- `dot_gitconfig`: Deploys to `~/.gitconfig` (Git global configuration).
- `dot_shellrc`: Deploys to `~/.shellrc` (Common shell configurations, aliases, and environment variables).
- `dot_zshrc`: Deploys to `~/.zshrc` (Zsh shell configuration, loading dot_shellrc and themes/plugins).
- `dot_config/zellij/config.kdl`: Deploys to `~/.config/zellij/config.kdl` (Zellij multiplexer configuration).

### Local Go Utilities
Located in `dot_local/src/utilities/`, these are compiled and made available locally in the user's path.
- `cmd/git-merged/`: Clean up merged git branches.
- `cmd/git-update-all-branches/`: Keep all local branches updated.
- `cmd/internet/`: Fast, simple check for active internet connection.
- `cmd/whatsmyip/`: Fetch public and private IP addresses.
- `go.mod`: Go module definition for local utilities.
- `README.md`: Specific documentation for building and using the Go utilities.

---

## Instructions for AI Assistants (Gemini, Claude, etc.)

When working in this repository:

1. **Understand Chezmoi Conventions:**
   - Files starting with `dot_` are deployed as hidden files (with a leading `.`) in the home directory.
   - Folders starting with `dot_` are deployed as hidden directories.
   - `.tmpl` files are Chezmoi templates.
   - Non-dotfiles / non-ignored files are deployed as normal files. Always respect `.chezmoiignore` when adding files to the repository.

2. **Core Mandates:**
   - **No Unsolicited Commits:** Do not stage or commit changes unless explicitly instructed by the user.
   - **Security:** Rigorously protect personal settings and avoid hardcoding or committing credentials/secrets.
   - **Precision edits:** Use targeted replacements and surgical file modifications rather than overwriting files, especially for user configuration dotfiles.
