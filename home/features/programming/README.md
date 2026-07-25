<div align="center">
  <img src="../../../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">Programming Environments & Toolchains</h3>

  <p align="center">
    Declarative IDE configurations, editor extensions, and language runtime toolchains.
  </p>
</div>

## Overview

This directory provides developer toolchains and code editor configurations. It separates IDE & editor settings (`editors/`) from compiler toolchains and language environment specs (`languages/`).

---

## Components Matrix

### 1. Code Editors & IDEs (`editors/`)
- **VS Code & VSCodium ([`vscode.nix`](file:///home/luis/nix-config/home/features/programming/editors/vscode.nix), [`vscodium.nix`](file:///home/luis/nix-config/home/features/programming/editors/vscodium.nix)):** Configured with custom extensions, telemetry disabled, Catppuccin theme, and formatters.
- **RStudio & R ([`R.nix`](file:///home/luis/nix-config/home/features/programming/editors/R.nix)):** R runtime environment and statistics tools.

### 2. Language Toolchains (`languages/`)
- **Python ([`python.nix`](file:///home/luis/nix-config/home/features/programming/languages/python.nix)):** Python 3 interpreter bundled with core scientific packages (`numpy`, `pandas`, `matplotlib`, `scipy`).
- **C++ ([`c++.nix`](file:///home/luis/nix-config/home/features/programming/languages/c++.nix)):** GCC/Clang compilers, `gdb` debugger, `cmake`, `ninja`, `bear` compilation database tool.
- **Reproducible Python Environments ([`example_python_flake.md`](file:///home/luis/nix-config/home/features/programming/languages/example_python_flake.md)):** Reference guide for per-project Nix devShell flakes.

---

## Directory Structure

```
home/features/programming/
├── default.nix       # Main programming module loader
├── editors/          # Graphical IDE & editor configurations
│   ├── R.nix
│   ├── vscode.nix
│   └── vscodium.nix
└── languages/        # Language toolchains & developer guides
    ├── c++.nix
    ├── example_python_flake.md
    └── python.nix
```
