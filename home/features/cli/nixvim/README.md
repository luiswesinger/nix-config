<div align="center">
  <img src="../../../../.assets/NixOS.svg" alt="NixOS Logo" width="80" height="80">

  <h3 align="center">NixVim Neovim Configuration</h3>

  <p align="center">
    Declarative Neovim keymaps, plugins, and options configured via NixVim.
  </p>
</div>

## Neovim Keymaps – Übersicht

Dieses Dokument listet die **Keymaps**, die in dieser NixVim-Konfiguration definiert sind. Sie sind inspiriert von nvChad und optimiert für den Workflow mit **Neo-tree**, **Terminal-Splits** und **Telescope**.

---

## Leader Key

Alle Shortcuts beginnen mit dem **Leader Key**: `Space` (im Folgenden als `S` bezeichnet).

---

## Keymaps Reference

### Neo-tree
| Shortcut | Aktion |
| :--- | :--- |
| `S e` | Neo-tree öffnen / Toggle |
| `S t` | Fokus auf Neo-tree ohne Toggle |

---

### Terminal
| Shortcut | Aktion |
| :--- | :--- |
| `S th` | Terminal in horizontalem Split öffnen |
| `S tv` | Terminal in vertikalem Split öffnen |
| `S tt` | Fokus auf das nächste Fenster (z.B. Terminal) |
| `<Esc><Esc>` | Terminalmodus verlassen und zurück in Normalmodus |

---

### Fenster-Fokus
| Shortcut | Aktion |
| :--- | :--- |
| `S n` | Fokus auf nächstes Fenster |
| `S p` | Fokus auf vorheriges Fenster |

---

### Telescope
| Shortcut | Aktion |
| :--- | :--- |
| `S ff` | Dateien suchen (`find_files`) |
| `S fg` | Live-Grep suchen (`live_grep`) |
| `S fb` | Buffers anzeigen (`buffers`) |
| `S fh` | Hilfe-Tags suchen (`help_tags`) |

---

### Markdown Preview
| Shortcut | Aktion |
| :--- | :--- |
| `S mv` | Aktiviert `markview` |
| `S md` | Aktiviert `markdown-preview` im Browser |

---

### Zathura PDF Viewer
| Shortcut | Aktion |
| :--- | :--- |
| `S z` | Öffnet aktuell in Neovim geöffnetes PDF in Zathura |

---

## Hinweise
- Die Shortcuts für Terminal und Tree ermöglichen es, **immer zwischen Editor, Terminal und Tree** zu wechseln, ohne Fenster versehentlich zu schließen.
- Weitere Plugin-Optionen befinden sich modularisiert im Ordner [`plugins/`](file:///home/luis/nix-config/home/features/cli/nixvim/plugins).
