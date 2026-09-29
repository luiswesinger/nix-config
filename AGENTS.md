# Repository Agent Guidelines

Welcome to @luiswesinger's NixOS configuration repository. This system is written declaratively using Nix Flakes and Home-Manager.

## Core Directives for AI Agents

1. **Maintainer Understanding is Priority #1**:
   - Luis built this configuration from scratch to learn NixOS thoroughly.
   - **NEVER** introduce complex abstractions, external flake modules, or "magic" code without clearly explaining **why** it is used and **how** it works in plain terms.
   - If suggesting a more modern or elegant Nix idiom, explain the tradeoff compared to the existing code.

2. **Respect the Repository Architecture**:
   - **`hosts/<hostname>/`**: Hardware specifics, host hostname, user groups, and imports of system modules.
   - **`modules/`**: System-level NixOS modules (NixOS options in `modules.services.<name>.enable` or desktop environments).
   - **`home/`**: Home-Manager user space.
     - `home/common.nix`: Common packages and styling inherited by all profiles.
     - `home/profiles/<profile>.nix`: Host-specific role configuration (e.g. `uni.nix` for laptop, `leisure.nix` for desktop, `minimal.nix` for minimal).
     - `home/features/<feature>/`: Granular feature blocks (cli, programming, ai, apps, gaming, appearance).
   - Always match existing naming conventions (e.g. `default.nix` loaders, clear comments with file path at top).

3. **Critical Nix Flake Rule (Git Staging)**:
   - Nix Flakes ONLY evaluate files tracked by Git.
   - Whenever creating a new `.nix` file or asset, you **MUST** stage it with `git add <file>` before testing or building. Unstaged new files will cause evaluation errors like "file not found" or "attribute missing".

4. **Safe Build & Verification Protocol**:
   - **NEVER** run `sudo nixos-rebuild switch` directly without dry-building or user approval.
   - First test syntax and evaluation:
     ```bash
     nix flake check
     ```
   - Test build the target host without activating it:
     ```bash
     nixos-rebuild build --flake .#<laptop|desktop|minimal>
     ```
   - Only propose switching after a clean build has succeeded.

5. **Documentation Integrity**:
   - If you add or remove modules, update the markdown tables and directory trees in the corresponding `README.md` (`README.md`, `modules/README.md`, `home/README.md`, etc.).
