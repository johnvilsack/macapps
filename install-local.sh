#!/usr/bin/env bash
# install.sh - Install mac apps
set -euo pipefail

SCRIPT="macapps"
BINSRC="./bin"
BINDEST="$HOME/.local/bin"

function run_installer() {
  echo "Installing $SCRIPT to $BINDEST..."

  # Verify bin directory exists
  if [ ! -d "$BINSRC" ]; then
      echo "Error: bin directory not found in current location"
      echo "Make sure you're running this from the $SCRIPT repository root"
      exit 1
  fi

  mkdir -p "$BINDEST"

  # Change to bin directory first
  cd "$BINSRC"
  
  find . -type f | while read -r file; do
      # Remove leading ./ from find output
      file="${file#./}"
      
      BINSRC_file="$file"
      BINDEST_file="$BINDEST/$file"

      # Ensure destination subdirectory exists
      mkdir -p "$(dirname "$BINDEST_file")"

      # Copy (overwrite if exists)
      cp "$BINSRC_file" "$BINDEST_file"
      echo "Copied $BINSRC_file to $BINDEST_file"

      # Make executable if it's a script
      if head -c 2 "$BINSRC_file" | grep -q '^#!'; then
          chmod +x "$BINDEST_file"
      elif [[ "$BINSRC_file" == *.sh || "$BINSRC_file" == *.ps1 ]]; then
          chmod +x "$BINDEST_file"
      fi
  done
  
  cd - >/dev/null

  echo "Installed scripts to $BINDEST"
}

function main() {
    echo "Running $SCRIPT installer..."
    run_installer

    echo "$SCRIPT installed!"
}

main