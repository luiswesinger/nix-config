# Neovim Keymaps – Übersicht

Dieses Dokument listet die **Keymaps**, die in dieser Konfiguration definiert sind. Sie sind inspiriert von nvChad und optimiert für den Workflow mit **Neo-tree**, **Terminal-Splits** und **Telescope**.

---

## Leader Key
Alle Shortcuts beginnen mit dem **Leader Key**: `Space` ab jetzt deklariert als: `S`

---

## Neo-tree
| Shortcut      | Aktion |
|---------------|--------|
| `S e`   | Neo-tree öffnen / Toggle |
| `S t`   | Fokus auf Neo-tree ohne Toggle |

---

## Terminal
| Shortcut       | Aktion |
|----------------|--------|
| `S th`   | Terminal in horizontalem Split öffnen |
| `S tv`   | Terminal in vertikalem Split öffnen |
| `S tt`   | Fokus auf das nächste Fenster (z.B. Terminal) |
| `<Esc><Esc>`   | Terminalmodus verlassen und zurück in Normalmodus |

---

## Fenster-Fokus
| Shortcut      | Aktion |
|---------------|--------|
| `S n`   | Fokus auf nächstes Fenster |
| `S p`   | Fokus auf vorheriges Fenster |

---

## Telescope
| Shortcut      | Aktion |
|---------------|--------|
| `S ff`  | Dateien suchen (`find_files`) |
| `S fg`  | Live-Grep suchen (`live_grep`) |
| `S fb`  | Buffers anzeigen (`buffers`) |
| `S fh`  | Hilfe-Tags suchen (`help_tags`) |

---

## Markdown Preview
| Shortcut      | Aktion |
|---------------|--------|
| `S mv`  | Aktiviert markview  |
| `S md`  | Aktiviert markdown-preview im Browser |

---

## Zathura
| Shortcut      | Aktion |
|---------------|--------|
| `S z`   | Öffnet aktuell in vim geöffnetes PDF in zathura|  

---


## Hinweise
- Diese Keymaps wurden für **nvChad-ähnliche Konfigurationen** erstellt, funktionieren aber auch in jedem Neovim mit Lua-Setup.  
- Du kannst die Leader-Key-Kombinationen in `extraConfigLua` anpassen, falls du ein anderes Präfix verwenden möchtest.  
- Die Shortcuts für Terminal und Tree ermöglichen es, **immer zwischen Editor, Terminal und Tree** zu wechseln, ohne Fenster versehentlich zu schließen.


