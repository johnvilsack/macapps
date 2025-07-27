#!/usr/bin/env bash
# install.sh - Install mac apps
set -euo pipefail

SCRIPT="macapps"
TEMPDIR="/tmp/$SCRIPT"
BINSRC="$TEMPDIR/bin"
BINDEST="$HOME/.local/bin"

REPO_URL="https://github.com/johnvilsack/${SCRIPT}.git"
EXISTING_HASH_FILE="$HOME/.local/.${SCRIPT}_last_hash"
CURRENT_HASH=$(curl -s https://api.github.com/repos/johnvilsack/$SCRIPT/commits/HEAD | grep '"sha"' | head -1 | cut -d'"' -f4)

function check_hash() {
  if [ -e "$EXISTING_HASH_FILE" ]; then
      LAST_HASH=$(cat "$EXISTING_HASH_FILE")
  else
      LAST_HASH=""
  fi

  if [ "$CURRENT_HASH" == "$LAST_HASH" ]; then
      echo "$SCRIPT is already up to date."
  else
        echo "New version of $SCRIPT detected. Updating..."
      run_installer
  fi
}

function run_installer() {
  echo "Installing $SCRIPT to $BINDEST..."

  # Clone or download
  if command -v git >/dev/null 2>&1; then
      [ -d "$TEMPDIR" ] && rm -rf "$TEMPDIR"
      git clone "$REPO_URL" "$TEMPDIR"
      cd "$BINSRC"
  else
      echo "Git not found. Please install git first."
      exit 1
  fi

  mkdir -p "$BINDEST"

  find . -type f | while read -r file; do

    # Remove leading ./ from find output
    file="${file#./}"
    
    BINSRC_file="$BINSRC/$file"
    BINDEST_file="$BINDEST/$file"

    # Ensure BINDESTination subdirectory exists
    mkdir -p "$(dirname "$BINDEST_file")"

    # Copy (overwrite if exists)
    cp "$BINSRC_file" "$BINDEST_file"

    # Make executable if it's a SCRIPT
    if head -c 2 "$BINSRC_file" | grep -q '^#!'; then
        chmod +x "$BINDEST_file"
    elif [[ "$BINSRC_file" == *.sh || "$BINSRC_file" == *.ps1 ]]; then
        chmod +x "$BINDEST_file"
    fi
  done

  echo "Installed SCRIPTs to $BINDEST"
}

function main() {
    echo "Running $SCRIPT installer..."
  check_hash
  # Cleanup
  rm -rf "$TEMPDIR"

  echo "$SCRIPT installed!"
}

main