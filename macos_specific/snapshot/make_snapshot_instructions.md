# How to regenerate the app snapshots

This folder holds two point-in-time reports about this Mac:

- `installed-apps.md` — every third-party app/CLI tool installed, and where it came from.
- `app-customizations.md` — for the apps that have configurable settings, a plain-English summary of what's been changed from defaults.

Both go stale as software gets installed, removed, or reconfigured. Re-run the steps below (e.g. ask Claude Code "regenerate the app snapshots using `macos_specific/snapshot/make_snapshot_instructions.md`") to refresh them. Do not commit this instructions file or the generated docs automatically — leave that to an explicit user request.

---

## 1. `installed-apps.md` — inventory of installed apps

Goal: a full picture of what's installed and how, organized so it's easy to scan.

### Sources to check

1. **Homebrew**
   - `brew list --formula -1` and `brew list --cask -1` for everything installed.
   - `brew leaves` for just the top-level formulae the user explicitly asked for (excludes transitive library dependencies — call these out as a single "~N additional formulae installed as dependencies" line rather than listing them all).
   - `brew tap` for any non-default taps in use.
   - Spot-check any cask whose app doesn't appear on disk (see step 4) with `brew info --cask <name>` — it may have a stale receipt (app removed manually without `brew uninstall`).

2. **GUI applications**
   - `ls /Applications` and `ls ~/Applications` for every installed `.app` plus any installer/uninstaller helper bundles.
   - Group them by rough category (Browsers, AI/Dev tools, Productivity/Office, Communication, System utilities, Creative, Gaming, Virtualization, Hardware drivers) — don't just dump a flat list.
   - Note PWA container folders (`Chrome Apps.localized`, `Chromium Apps.localized`, `Helium Apps.localized`, etc.) separately since they aren't standalone installs and would inflate the count if treated as apps.
   - Try `mas list` for Mac App Store apps if the `mas` CLI is installed (it often isn't — don't treat its absence as an error).

3. **Language / package-manager globals**
   - npm: check the active Node version manager first (`command -v n` / `nvm` / `mise` / `asdf`) since global packages live under whichever tool manages the runtime, not always in a predictable spot. Then `npm list -g --depth=0`.
   - cargo: `ls ~/.cargo/bin` and `cargo install --list`.
   - go: `go env GOPATH` then `ls $GOPATH/bin`.
   - pip/pipx: `pip3 list --user` and `pipx list` (or `/opt/homebrew/bin/pipx list` directly if `pipx` isn't on PATH under the active Python).
   - uv/uvx: these don't "install" persistently in the same way — note any tools run via `uvx <tool>` from shell history as ad-hoc, not installed.
   - Cross-check binaries actually on `$PATH` with `which <tool>` — history may show a tool installed via one manager (e.g. `npm i -g bun`) but it now resolves from another (e.g. Homebrew) after a later reinstall. Report where it actually resolves from today, and note the discrepancy if the origin changed.

4. **Shell history**
   - Locate the history file (`echo $HISTFILE`, usually `~/.zsh_history`) and grep for install-type commands rather than reading it raw:
     - `brew (install|reinstall) ...`
     - `npm (i|install) (-g|--global) ...`, `yarn global add`, `pnpm add -g`
     - `cargo install ...`, `go install ...`
     - `pip3? install ...`, `pipx install ...`, `gem install ...`
     - `uv tool install ...`, `uvx ...`
     - `curl ... | sh|bash|zsh` (installer scripts) — list these separately since they're outside every package manager's bookkeeping and often the source of things like rustup, uv, Claude Code, Cursor, CodeRabbit CLI.
   - Use this to catch tools that were installed by hand and might not show up cleanly in a package manager's current state (e.g. something later removed, or a manager that was swapped out).

5. **Discrepancy pass**
   - For any app that a package manager claims is installed but isn't found on disk (bitwarden was installed via brew, but the user uninstalled it by removing the Bitwarden.app file, so brew thought it was still installed), search for it explicitly (`mdfind`, `find / -maxdepth 4 -iname "*name*"`) and call it out as a stale receipt worth cleaning up, rather than silently including or excluding it.

### Output shape

Group into: GUI Applications (system-wide, then user-scoped), Homebrew (Casks, Formulae, Custom taps), Language & package-manager globals (as a table: manager → what's installed), Installer scripts found in history, and a short Notes section for anything surprising (version manager choice, stale receipts, broad toolchain observations). Keep it a snapshot, not prose — tables and short bullet groups over paragraphs.

---

## 2. `app-customizations.md` — what's actually been changed

Goal: for apps from `installed-apps.md` that have configurable settings, explain **what's non-default** in plain English — not a config dump.

### Step 1 — inventory this dotfiles repo

This repo (`~/.dotFiles`) is the primary source of intentional, version-controlled config. Walk it (e.g. `find . -maxdepth 3 -not -path '*/.git*'`) and read every app-specific config file and the Ansible task that installs/links it, e.g.:

- `zshrc`, `tasks/zsh.yml`
- `tmux/tmux.conf`, `tmux/{dark,light}mode.conf`, `tasks/tmux.yml`
- `nvim/init.lua`, `nvim/lua/user/**` (options, keybinds, per-plugin config, session management), `tasks/nvim.yml`
- `tasks/git.yml`, `tasks/ssh.yml`
- `macos_specific/ghostty/*`
- `macos_specific/swiftbar_plugin_dir/*`
- `zathurarc`, `tasks/apps/zathura.yml`
- `tasks/apps/lazygit.yml`, `tasks/apps/qmk.yml`
- `scripts/*` (especially anything cross-referenced from the configs above, like `toggle-dark-mode`)
- Linux/WSL-only pieces (`gnome_specific/*`, `wsl-configs/*`) — worth a short mention if they're part of a shared mechanism (see the dark-mode switcher below), but don't build out full sections for them in a macOS-focused report.

Read enough of each file to describe *what changed and why it matters*, not just restate the syntax. If several apps are wired together by one script (in this repo, `scripts/toggle-dark-mode` touches macOS appearance, Ghostty, tmux, VS Code, and — on other platforms — GNOME/Windows Terminal), give that mechanism its own short section up top rather than repeating the explanation under every app it touches.

### Step 2 — check live preferences for apps *not* managed by this repo

Some installed apps are customized through their own UI, not tracked in dotfiles. Check these directly rather than assuming "no config" for anything not in the repo:

- **VS Code / Cursor**: `~/Library/Application Support/Code/User/settings.json` and `keybindings.json` (Cursor: same path under `Cursor/`). These often carry substantial customization (Vim emulation keymaps, theme, font, formatting rules) even though they're not symlinked from the dotfiles repo.
- **Karabiner-Elements**: `~/.config/karabiner/karabiner.json`. Parse with `python3 -m json.tool` or pull just the rule descriptions:
  ```
  python3 -c "
  import json
  d = json.load(open('$HOME/.config/karabiner/karabiner.json'))
  for p in d['profiles']:
      for r in p.get('complex_modifications', {}).get('rules', []):
          print(r.get('description'))
  "
  ```
- **Menu bar utilities / small macOS apps** (AltTab, Scroll Reverser, MiddleClick, Caffeine, SwiftBar, Hidden Bar, etc.): these store settings via `defaults`, not a config file. First find the real bundle ID — don't guess it from the app name:
  ```
  defaults domains | tr ',' '\n' | grep -iE "alt-tab|hidden|scroll|middle|caffeine|swiftbar"
  ```
  Then dump each: `defaults read <bundle.id>`. Skip noisy keys (window frame positions, Sparkle auto-update bookkeeping, analytics IDs) and report only settings a user would recognize as a deliberate choice (e.g. `tapToClick = 0`, `ReverseX = 1`, custom shortcut key combos, icon-hidden flags).
- **Docker Desktop**: `~/Library/Group Containers/group.com.docker/settings-store.json` — check resource limits (`MemoryMiB`, `CpuCount`, `DiskSizeMiB`) and `AutoStart`.
- **Sublime Text**: look for `~/Library/Application Support/Sublime Text/Packages/User/*.sublime-settings`. Often empty/default — fine to report as "no customization found" rather than skip silently.
- **Raycast**: settings live in a proprietary sync store, not a plain file — don't try to force a diff here; just note it's installed with no practically-reportable config.

### Step 3 — write it up

Group by rough theme (Shell & terminal, Editors, Dev tools, System utilities), one `###` subsection per app. Under each: a few bullets in plain English — what's different from default and why it's useful — not raw config syntax. Bold the key custom values (shortcuts, theme names) so they're scannable. Close with a "Checked, nothing customized" section listing apps that were verified but found stock, so it's clear they weren't just missed.

### Output location

Both files live in `macos_specific/snapshot/`. Cross-link them (`installed-apps.md` ↔ `app-customizations.md`) with relative paths — remember any links from `app-customizations.md` back into the repo root (e.g. to `scripts/toggle-dark-mode`) need `../../` since this folder is two levels deep from repo root.
