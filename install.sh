#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$HOME/.claude.backup.$(date +%Y%m%d-%H%M%S)"

mkdir -p "$CLAUDE_DIR"

link() {
  local src="$1"
  local dst="$2"

  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok    $dst"
    return
  fi

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/"
    echo "backup $dst -> $BACKUP_DIR/"
  fi

  ln -s "$src" "$dst"
  echo "link  $dst -> $src"
}

link "$DOTFILES_DIR/claude/CLAUDE.md"    "$CLAUDE_DIR/CLAUDE.md"
link "$DOTFILES_DIR/claude/settings.json" "$CLAUDE_DIR/settings.json"

echo
echo "Done. Dotfiles linked from $DOTFILES_DIR"
[ -d "$BACKUP_DIR" ] && echo "Replaced files backed up to $BACKUP_DIR"
