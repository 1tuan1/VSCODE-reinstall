# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains a shell function (`reset_vscode`) that performs a complete VS Code reset on macOS. It backs up user data, uninstalls VS Code, reinstalls via Homebrew, and sets up the `code` CLI command.

## Usage

The function is designed to be sourced into a shell profile (`~/.zshrc` or `~/.bash_profile`), then invoked:

```bash
source setup.sh  # or add to shell profile
reset_vscode
```

## Architecture

Single shell script (`setup.sh`) that performs:
1. Creates timestamped backup at `~/vscode-backup-YYYYMMDD-HHMMSS`
2. Backs up: `~/Library/Application Support/Code`, preferences, and `~/.vscode*` directories
3. Kills all VS Code processes (requires sudo)
4. Removes all VS Code files from `/Applications`, `~/Library/*`, and home directory
5. Reinstalls via `brew install --cask visual-studio-code`
6. Launches VS Code and installs the `code` shell command

## Platform

macOS only (uses `~/Library/` paths, Homebrew, and `osascript`).
