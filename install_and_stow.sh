#!/bin/env bash

# Set the path to your dotfiles directory (adjust as needed)
DOTFILES_DIR="$(pwd)"
# Set paths (adjust as needed) 
DOTFILES_DIR="$(pwd)"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d)"  # Dynamic backup name with date

# Function to backup a file if it exists
backup_if_exists() {
  if [ -f "$1" ]; then
     mkdir -p "$BACKUP_DIR"
     echo "Backing up existing $1 to $BACKUP_DIR"
     mv "$1" "$BACKUP_DIR"
  fi
}

# Execute the setup script
if [ -f "$DOTFILES_DIR/setup/setup.sh" ]; then
  echo "Running setup script..."
  bash "$DOTFILES_DIR/setup/setup.sh"
else
  echo "Setup script not found. Skipping."
fi

# Stow - Backup existing
echo "Stowing dotfiles (backing up any conflicts)..."
for dir in "$DOTFILES_DIR"/*; do
  if [ -d "$dir" ] && [ "$(basename "$dir")" != "setup" ]; then
    target_dir="$HOME/."$(basename "$dir")  # Add leading '.' for hidden files/dirs
    backup_if_exists "$target_dir"
    stow -v -t "$HOME" "$(basename "$dir")"
  fi
done

echo "Dotfile setup complete! Backups (if any) placed in $BACKUP_DIR"
