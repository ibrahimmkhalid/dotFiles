# Installed Apps Inventory

A snapshot of third-party applications and CLI tooling installed on this machine, compiled from `/Applications`, `~/Applications`, Homebrew, npm, cargo, go, pip/pipx, and shell history.

> Generated 2026-08-13. Package managers drift over time — treat this as a point-in-time snapshot, not a living document.

---

## GUI Applications

### System-wide (`/Applications`)

| Category              | Apps |
|-----------------------|---|
| Browsers              | Google Chrome, Zen, Safari *(built-in)* |
| AI / Dev tools        | Claude, ChatGPT, Cursor, Visual Studio Code, Sublime Text, T3 Code (Nightly), Xcode, Android Studio, Docker, Postman, Ghostty |
| Productivity / Office | Microsoft Word, Excel, PowerPoint, OneNote, Outlook, Teams (+ Defender Shim), Google Docs / Sheets / Slides *(Chrome PWAs)*, Google Drive, OneDrive, Obsidian, Adobe Acrobat DC, Thunderbird |
| Communication         | Slack, Discord, WhatsApp, zoom.us |
| System utilities      | Raycast, AltTab, Hidden Bar, MiddleClick, Scroll Reverser, Shottr, Hex Fiend, SquirrelDisk, Karabiner-Elements + EventViewer, SwiftBar, Caffeine, Yubico Authenticator, Space Rabbit, logioptionsplus |
| Creative              | GIMP |
| Gaming / remote play  | Steam, Steam Link, GeForce NOW, Moonlight, Happiness |
| Virtualization        | VirtualBox, CrossOver |
| Hardware drivers      | Original Prusa Drivers |

### User-scoped (`~/Applications`)

- **Autodesk Fusion.app** — plus Fusion Service Utility and its uninstaller
- **GrandPerspective.app** — disk usage visualizer
- **Claude Code URL Handler.app** — helper app for Claude Code
- `Chrome Apps.localized`, `Chromium Apps.localized`, `Helium Apps.localized` — PWA containers, not standalone installs
- `CrossOver/` — support files for the CrossOver cask

---

## Homebrew

### Casks

```
alt-tab               hiddenbar            shottr
karabiner-elements    sublime-text         visual-studio-code
domzilla-caffeine     middleclick          swiftbar
hex-fiend             postman              t3-code
scroll-reverser
```

### Formulae (top-level only — via `brew leaves`)

```
ansible       git         make          qpdf
apfel         git-lfs     neofetch      ranger
btop          glpk        ninja         ripgrep
cmake         go          openjdk       scrcpy
cocoapods     gh          pipx          tldr
curl          htop        postgresql@18 tmux
dbus          jq          unzip
dotnet        lazygit     vim
entr          llama.cpp   wget
fzf           gawk
gcc
```

~90 additional formulae are installed as transitive dependencies (image/codec/crypto/X11 libraries) and aren't listed individually.

### Custom taps

- `qmk/qmk` — QMK firmware
- `unhappychoice/tap` — gittype
- `anomalyco/tap`
- `osx-cross/arm`, `osx-cross/avr` — embedded cross-compilers
- `homebrew-zathura/zathura`

---

## Language & package-manager globals

| Manager                               | Installed |
|---------------------------------------|---|
| **npm** (via `n`, Node v20.13.1)      | `opencode-ai`, `corepack` |
| **Homebrew-installed JS CLIs**        | `bun`, `pnpm`, `codex` — originally `npm i -g`'d per history, now resolving from `/opt/homebrew/bin` |
| **cargo** (Rust, via rustup)          | `tree-sitter-cli` + standard rustup toolchain (rustc, clippy, rust-analyzer, rustfmt, miri, etc.) |
| **pipx**                              | none currently — history shows `basedpyright`, `ruff`, `debugpy`, `gitingest` were installed at some point but the pipx venv store is now empty |
| **uv / uvx** (ad-hoc, not persistent) | `askllm`, `mypy` |
| **go install**                        | none currently in `~/go/bin` |
| **pip3 --user**                       | none currently listed |

### Installer scripts found in shell history (`curl \| sh`)

- [rustup.rs](https://rustup.rs) — Rust toolchain
- [astral.sh/uv](https://astral.sh/uv) — Python package manager
- `claude.ai/install.sh` — Claude Code
- `cli.coderabbit.ai/install.sh` — CodeRabbit CLI
- `cursor.com/install` — Cursor

---

## Notes

- Node is managed via **`n`**, not nvm/mise/asdf — none of those are present on this machine.
- Toolchain spans full-stack, embedded (QMK, AVR/ARM cross-compilers, `mdloader`), ML (llama.cpp), infra (Ansible, PostgreSQL, .NET, Java), and several AI coding CLIs (Claude Code, Cursor, Codex, T3 Code, CodeRabbit).
- PWA container folders (Chrome/Chromium/Helium Apps) are noted separately since they aren't standalone installs and would otherwise inflate the app count.
