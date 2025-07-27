#!/usr/bin/env bash
# install-local.sh - Install mac apps from current directory
set -euo pipefail

SCRIPT="macapps"
BINSRC="./bin"
BINDEST="$HOME/.local/bin"

function run_installer() {
    echo "Installing $SCRIPT from current directory to $BINDEST..."

    # Verify we're in the right place
    if [ ! -d "$BINSRC" ]; then
        echo "Error: bin directory not found in current location"
        echo "Make sure you're running this from the $SCRIPT repository root"
        exit 1
    fi

    mkdir -p "$BINDEST"

    cd "$BINSRC"
    find . -type f | while read -r file; do
        BINSRC_file="$BINSRC/$file"
        BINDEST_file="$BINDEST/$file"

        # Ensure destination subdirectory exists
        mkdir -p "$(dirname "$BINDEST_file")"

        # Copy (overwrite if exists)
        cp "$BINSRC_file" "$BINDEST_file"

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
    echo "Running $SCRIPT local installer..."
    run_installer
    echo "$SCRIPT installed from local directory!"
}

main