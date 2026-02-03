# Add this function to your ~/.zshrc or ~/.bash_profile, then source the file or open a new terminal

reset_vscode() {
    local backup_dir="$HOME/vscode-backup-$(date +%Y%m%d-%H%M%S)"
    
    echo "VS Code Reset with Backup to: $backup_dir"
    
    # 1. Create backup directory
    mkdir -p "$backup_dir"
    
    # 2. Backup key directories (settings, extensions, keybindings)
    cp -r ~/Library/Application\ Support/Code "$backup_dir/" 2>/dev/null || echo "No user data folder found"
    cp ~/Library/Preferences/com.microsoft.VSCode.plist "$backup_dir/" 2>/dev/null || true
    cp -r ~/.vscode* "$backup_dir/" 2>/dev/null || true
    
    echo "Backup created at $backup_dir"
    
    # 3. Kill all VS Code processes
    sudo killall "Code Helper" "Code Helper (Renderer)" "Visual Studio Code" 2>/dev/null
    
    # 4. Complete uninstall
    sudo rm -rf "/Applications/Visual Studio Code.app"
    rm -rf ~/Library/Application\ Support/Code
    rm -rf ~/Library/Preferences/com.microsoft.VSCode*
    rm -rf ~/Library/Saved\ Application\ State/com.microsoft.VSCode.savedState
    rm -rf ~/Library/Caches/com.microsoft.VSCode*
    rm -rf ~/Library/Logs/VSCode*
    rm -rf ~/.vscode*
    
    echo "Uninstallation complete."
    
    # 5. Reinstall via Homebrew
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Install it or download VS Code manually."
        return 1
    fi
    
    brew install --cask visual-studio-code
    
    echo "Installation complete. Starting VS Code..."
    open -a "Visual Studio Code"
    
    # 6. Setup 'code' command
    sleep 5
    osascript -e 'tell application "Visual Studio Code" to do script "Shell Command: Install \"code\" command in PATH"'
    
    echo "Done! Backup: $backup_dir"
    echo "To restore extensions later: copy from backup/Code/User/extensions/ to new folder"
}

# Usage: reset_vscode
