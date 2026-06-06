# Utilities (Chezmoi Source)

This directory contains the source for various Go utilities. It is managed by **chezmoi** and should **never** be executed directly from this location (`dot_local/src/utilities/`).

## Deployment
These tools are deployed by chezmoi to `~/.local/src/utilities/`. 

To apply changes made here to your system:
```bash
chezmoi apply
```

## Purpose
- **internet**: Checks connectivity by pinging Google's Public DNS (8.8.8.8) four times.
- **whatsmyip**: Detects and prints public IPv4 and IPv6 addresses using dyndns services.
- **git-update-all-branches**: Fetches all updates and rebases every local branch onto its upstream.
- **git-merged**: Safely removes local branches that have been merged into the current branch.

## LLM Guidance
- **Source Location:** Always modify the files within the chezmoi source directory (`~/.local/share/chezmoi/dot_local/src/utilities/`).
- **Tools:**
    - `cmd/internet/main.go` -> builds to `internet`
    - `cmd/whatsmyip/main.go` -> builds to `whatsmyip`
    - `cmd/git-update-all-branches/main.go` -> builds to `git-update-all-branches`
    - `cmd/git-merged/main.go` -> builds to `git-merged`
- **Deployment:** Remind the user to run `chezmoi apply` after modifications to see changes in the deployed version.
- **Simplicity:** Keep the tools focused and lightweight.
- **Style:** Maintain the emoji prefix in console output.
