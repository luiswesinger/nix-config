---
name: nixos-workflow
description: >-
  Standard operating procedure for modifying, formatting, validating, and testing
  changes to this NixOS Flake repository.
---

# NixOS Flake Workflow Skill

Use this procedure whenever you add packages, modify system options, or create new Nix modules in this repository.

## Step-by-Step Procedure

### 1. Identify Module Placement
- System daemon or OS service? -> Place in `modules/system/services/<name>.nix` and register in `modules/system/services/default.nix`.
- User CLI tool or GUI app? -> Place in `home/features/<domain>/<name>.nix`.
- Host-specific toggle? -> Adjust `hosts/<hostname>/configuration.nix`.

### 2. Stage New Files Immediately
Nix flakes will fail with `attribute missing` or `file not found` if files are untracked:
```bash
git status
git add path/to/new_module.nix
```

### 3. Verify Flake Evaluation
Run check on flake outputs:
```bash
nix flake check
```

### 4. Dry-Run Rebuild
Verify that the configuration builds cleanly into a derivation without activating it:
```bash
# For laptop:
nixos-rebuild build --flake .#laptop

# For desktop:
nixos-rebuild build --flake .#desktop
```

### 5. Format & Clean
Format any modified nix files before finishing using `nixfmt-rfc-style` or standard indentation (2 spaces).
