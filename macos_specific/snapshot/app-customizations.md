# App Customizations

A plain-English summary of the non-default configuration applied to installed
apps, pulled from this dotfiles repo (`~/.dotFiles`) and from each app's live
preferences on this Mac. Companion to
[`installed-apps.md`](./installed-apps.md).

> Generated 2026-08-13. Preferences drift as apps update — treat this as a snapshot.

---

## The unified dark-mode switcher

Several apps below are wired into one custom script, [`scripts/toggle-dark-mode`](../../scripts/toggle-dark-mode), triggered by **Ctrl+Y** in zsh, **Ctrl+Y** in tmux, or a menu bar button (via SwiftBar). One keypress flips, in order:

1. macOS system appearance (light ↔ dark)
2. Ghostty's color theme (swaps in `dark.conf` or `light.conf`, then signals Ghostty to reload)
3. tmux's status bar theme (swaps in `darkmode.conf` or `lightmode.conf`, then reloads the running session)
4. VS Code's `workbench.colorTheme` (text-replaces "Light"/"Dark" in the active Everforest theme name)
5. *(Linux/WSL only)* GNOME Terminal, GNOME shell theme, and Windows Terminal's color scheme

All the color choices use the **Everforest** palette (dark for dark mode, light-hard for light mode) for visual consistency across every tool.

---

## Shell & terminal

### Zsh
- Oh My Zsh with the **agnoster** theme and the **zsh-autosuggestions** plugin (greyed-out ghost-text completions as you type).
- fzf (fuzzy finder) wired directly into the shell.
- Custom shortcuts: **Ctrl+F** opens a tmux project switcher, **Ctrl+T** opens a global to-do list, **Ctrl+Y** toggles dark mode, **Ctrl+O** launches a custom AI-query script (`askllm`).
- Custom aliases: `git-done` / `git-update` / `git-repeat` (one-shot add+commit+push combos), `lg` → lazygit, `cl` → a custom `codellm` script, plus typo-catchers (`clera`→`clear`, `sl`→`ls`).
- Helper functions for the Jupyter "ascending" notebook-sync workflow (renaming `.ipynb` ↔ `.sync.ipynb`), converting notebooks to `.py`, and copying the current folder to a Desktop/Projects path (Windows/WSL helpers).
- `$PATH` extended for Go, the Turso CLI, and the `n` Node version manager.
- Sources an optional `~/.localrc` and per-project `.project_env` for machine-specific overrides that don't live in version control.

### tmux
- Prefix key remapped from the default **Ctrl+B** to **Ctrl+Space**.
- Mouse support on; vi-style keys in copy mode; windows/panes numbered starting at **1** instead of 0.
- Pane navigation with **Ctrl+H/J/K/L** (mirrors Vim split navigation) and **Ctrl+N/P** to cycle between tmux clients.
- Same quick-launcher shortcuts as zsh: Ctrl+F (project switcher), Ctrl+T (to-do list), Ctrl+Y (dark mode toggle), Ctrl+O (askllm).
- Copy-mode `y` sends the selection to the OS clipboard, auto-detecting Linux (xsel/xclip), macOS (pbcopy), or Windows/WSL (clip.exe).
- Status bar uses the Everforest theme, swapped light/dark by the dark-mode toggle.
- Plugins (via TPM): **vim-tmux-navigator** (seamless Vim ↔ tmux pane movement), **tmux-yank**, **tmux-autoreload** (auto-reloads config on file change).

### Ghostty
- Font: **FiraCode Nerd Font**, size 16.
- Window fixed at 120×40 characters, opened at a specific screen position.
- Custom **Everforest dark/light** color palettes, hot-swapped by the dark-mode toggle script (which sends Ghostty a `SIGUSR2` signal to reload).

### SwiftBar
- Runs a single custom plugin from this repo ([`toggle-dark-mode.sh`](../swiftbar_plugin_dir/toggle-dark-mode.sh)) that adds a "◐" button to the menu bar — clicking it runs the dark-mode toggle.
- Its own menu bar icon is hidden ("stealth mode"), so only the custom button is visible.

---

## Editors

### Neovim
- Built from source (not the Homebrew `vim` package) and configured entirely in Lua, loaded via the `lazy.nvim` plugin manager.
- Space is the leader key; relative line numbers; 2-space indent; case-insensitive search (unless mixed case is typed); persistent undo history across sessions; new splits open below/right.
- Custom keymaps: fast scrolling that recenters the screen, window resizing with Ctrl+Arrow keys, system-clipboard copy/paste on `<leader>y`/`<leader>p`, moving selected lines up/down, and paste/line-ending workarounds for WSL.
- **Everforest** colorscheme, tied into the same dark-mode file the toggle script writes to — a background file-watcher flips the theme automatically the moment `toggle-dark-mode` runs, even in an already-open Neovim session.
- LSP tooling auto-installed via Mason for Bash, C/C++, Lua, Markdown, Python (basedpyright + ruff), Rust, SQL, TypeScript, LaTeX, Go, and Tailwind CSS, plus debug adapters for C++ and Python.
- Custom statusline (lualine) showing git branch, diagnostics, filename, and the active LSP's name.
- Custom session manager: `<leader>ss`/`sf`/`sd` save/load/delete a session tied to the current directory, and any existing session auto-saves on exit.
- Plugin set includes fuzzy search (Telescope), a file tree (Neo-tree), inline git blame/signs, Jupyter notebook editing, LaTeX support, smarter code folding (nvim-ufo), and quick file-jumping (Harpoon).

### VS Code
- **Vim emulation** (via the Vim extension) reconfigured to closely mirror the Neovim setup above: space leader, Ctrl+H/J/K/L to move between editor groups, `gd`/`gr`/`gR`/`ga` for go-to-definition/references/rename/quick-fix, and a full set of `<leader>d*` bindings for stepping through the debugger.
- Font: FiraCode Nerd Font, ligatures off; relative line numbers; minimap and breadcrumbs off; sidebar moved to the right edge; word wrap on.
- **Everforest** theme (high-contrast light/dark variants), swapped automatically by the dark-mode toggle script.
- GitHub Copilot enabled everywhere except plaintext/markdown files.
- Jupyter notebooks open in the native notebook UI with the kernel-restart confirmation disabled.
- Workspace trust prompt disabled (no "do you trust this folder?" nag).
- Remote-SSH platform hints pre-set for two home-network IPs so VS Code doesn't have to autodetect the remote OS.
- Format-on-save opinions: Google style for C/C++ (clang-format), explicit default formatters for JSON/HTML.

### Cursor
- Minimal customization — just set to auto-detect and follow the macOS system light/dark appearance rather than being driven by the manual toggle script.

---

## Dev tools

### Git
- Global identity: `Ibrahim Mansoor Khalid` / `ibrahimmkhalid@gmail.com`.
- Default editor set to `nvim`.
- Default branch name for new repos set to `main`.
- A global `.gitignore` (`core.excludesfile`) applied automatically to every repo on the machine.

### SSH
- A personal ed25519 keypair from this repo is deployed to `~/.ssh` and added to `authorized_keys`, so the machine can authenticate the same way on a fresh setup.

### Lazygit
- No dedicated settings file — just installed and aliased to `lg` in zsh.

### QMK (keyboard firmware toolchain)
- No custom keymap tracked in this repo, but the whole dev environment is scripted: clones the QMK firmware repo, installs the `qmk` CLI via pipx, and runs `qmk setup` — used for building/flashing custom keyboard firmware.

### Zathura (PDF viewer)
- Vim-style navigation: `h`/`l` previous/next page, `J`/`K` zoom out/in, `r` reload, `R` rotate, `p` print.
- Font set to FiraCode Nerd Font; large default window (3000×3000); selections copy straight to the system clipboard.

---

## System utilities

### Karabiner-Elements
Remaps three Windows/Linux-style text-editing shortcuts to their native macOS equivalents, so the muscle memory carries over:
- **Ctrl+Backspace/Delete → Option+Backspace/Delete** (delete a whole word)
- **Ctrl+Arrow → Option+Arrow** (move cursor by word)
- **Ctrl+Shift+Arrow → Option+Shift+Arrow** (select by word)

Menu bar icon hidden.

### AltTab
- Menu bar icon hidden.
- A custom shortcut profile: hold **⌘ (Command)** and press **`` ` ``** (backtick) to cycle windows, showing windows from every Space, every display, and minimized/hidden apps — broader than the default Cmd+Tab behavior.
- Window preview-on-focus disabled; switch delay set to 50 ms.

### Scroll Reverser
- Reverses scroll direction for a **mouse** only (horizontal axis inverted); trackpad scrolling is left at the natural macOS default.
- Runs with no menu bar icon.

### MiddleClick
- Tap-to-click emulation disabled.
- Runs with no menu bar icon.

### Caffeine
- Set to activate ("keep this Mac awake") immediately on launch, instead of requiring a manual click.

### Docker Desktop
- Set to auto-start at login. CPU/RAM/disk resource limits are left at their defaults.
