<div align="center">

# 🔄 VS Code Reset Tool

**A one-command solution to completely reset Visual Studio Code on macOS**

[![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![VS Code](https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

---

*VS Code acting up? Extensions conflicting? Settings corrupted?*
*Start fresh in seconds with automatic backup.*

</div>

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🔒 **Auto Backup** | Creates timestamped backup before any changes |
| 🧹 **Complete Clean** | Removes all VS Code files, caches, and preferences |
| 📦 **Auto Reinstall** | Fresh installation via Homebrew |
| ⌨️ **CLI Setup** | Automatically configures the `code` command |

## 📋 Requirements

- macOS
- [Homebrew](https://brew.sh/) installed

## 🚀 Quick Start

### Option 1: Clone and Run
```bash
git clone https://github.com/1tuan1/VSCODE-reinstall.git
cd VSCODE-reinstall
./setup.sh
```

### Option 2: One-liner
```bash
curl -fsSL https://raw.githubusercontent.com/1tuan1/VSCODE-reinstall/main/setup.sh | bash
```

## 🔧 What It Does

```
┌─────────────────────────────────────────────────────────────┐
│                    VS Code Reset Process                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   1. 💾 BACKUP        Create timestamped backup             │
│         ↓                                                   │
│   2. 🛑 TERMINATE     Kill all VS Code processes            │
│         ↓                                                   │
│   3. 🗑️  REMOVE        Delete all VS Code files             │
│         ↓                                                   │
│   4. 📥 INSTALL       Fresh install via Homebrew            │
│         ↓                                                   │
│   5. 🚀 LAUNCH        Start VS Code + setup CLI             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Files Removed

```
/Applications/Visual Studio Code.app
~/Library/Application Support/Code
~/Library/Preferences/com.microsoft.VSCode*
~/Library/Saved Application State/com.microsoft.VSCode.savedState
~/Library/Caches/com.microsoft.VSCode*
~/Library/Logs/VSCode*
~/.vscode*
```

## 📁 Backup Location

Your backup is saved to:
```
~/vscode-backup-YYYYMMDD-HHMMSS/
├── Code/                 # User data & extensions
├── com.microsoft.VSCode.plist
└── .vscode*/            # Global VS Code config
```

## ♻️ Restore From Backup

<details>
<summary><b>Restore Extensions</b></summary>

```bash
cp -r ~/vscode-backup-*/Code/User/extensions/* ~/.vscode/extensions/
```
</details>

<details>
<summary><b>Restore Settings</b></summary>

```bash
cp ~/vscode-backup-*/Code/User/settings.json ~/Library/Application\ Support/Code/User/
```
</details>

<details>
<summary><b>Restore Keybindings</b></summary>

```bash
cp ~/vscode-backup-*/Code/User/keybindings.json ~/Library/Application\ Support/Code/User/
```
</details>

## ⚠️ Warning

> This script requires `sudo` to kill VS Code processes and remove the application.
> Always review scripts before running them.

## 📄 License

[MIT](LICENSE) - feel free to use and modify.

---

<div align="center">

**[⬆ Back to Top](#-vs-code-reset-tool)**

</div>
