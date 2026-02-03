# VS Code Reset Tool

A shell script to completely reset Visual Studio Code on macOS. Useful when VS Code becomes corrupted, slow, or you want a clean slate.

## Requirements

- macOS
- [Homebrew](https://brew.sh/)

## Usage

```bash
git clone https://github.com/yourusername/VSCODE-reinstall.git
cd VSCODE-reinstall
./setup.sh
```

Or run directly:
```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/VSCODE-reinstall/main/setup.sh | bash
```

## What It Does

1. **Creates backup** at `~/vscode-backup-YYYYMMDD-HHMMSS/`
   - User settings and preferences
   - Extensions data
   - Keybindings

2. **Kills all VS Code processes**

3. **Removes all VS Code files**
   - `/Applications/Visual Studio Code.app`
   - `~/Library/Application Support/Code`
   - `~/Library/Preferences/com.microsoft.VSCode*`
   - `~/Library/Saved Application State/com.microsoft.VSCode.savedState`
   - `~/Library/Caches/com.microsoft.VSCode*`
   - `~/Library/Logs/VSCode*`
   - `~/.vscode*`

4. **Reinstalls VS Code** via Homebrew

5. **Launches VS Code** and sets up the `code` CLI command

## Restoring From Backup

After reset, you can restore your extensions:
```bash
cp -r ~/vscode-backup-*/Code/User/extensions/* ~/.vscode/extensions/
```

To restore settings:
```bash
cp ~/vscode-backup-*/Code/User/settings.json ~/Library/Application\ Support/Code/User/
```

## Warning

This script requires `sudo` to kill VS Code processes and remove the application. Review the script before running.

## License

MIT
