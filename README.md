# macapps - MacOS Command Line Utilities

Collection of shell scripts for macOS efficiency. Commands install to `$HOME/.local/bin`.

## Installation
```bash
curl -fsSL https://raw.githubusercontent.com/johnvilsack/macapps/refs/heads/main/install-local.sh | bash
```

## Applications

### gitversion - Semantic versioning automation
Auto-versioning with git integration. Handles .version file, CHANGELOG.md, tagging, and pushing.

**Prefixes:**
- `MAJOR|RELEASE|BREAKING:` - Bumps major (1.0.0), creates release tag
- `MINOR|FEATURE|FEAT:` - Bumps minor (x.1.0), creates tag  
- `PATCH|FIX:` - Bumps patch (x.x.1), no tag
- No prefix - Creates subversion (x.x.x-1)

**Usage:**
```bash
gitversion "FEATURE: Add new functionality"
gitversion "FIX: Critical bug fix" 
gitversion reponame "MAJOR: Breaking changes"
```

**Environment:** Requires `$GITHUBPATH` for remote repos.

### clog/pclog - Cross-platform logging
Colorized logging with file rotation. pclog is PowerShell wrapper.

**Levels:** INFO(blue), WARNING(yellow), ERROR(red), SUCCESS(green), DEBUG(magenta), TRACE(cyan)

**Usage:**
```bash
clog INFO "Application started"
clog ERROR --timestamp --pid "Failed to connect"
```

**Environment:** 
- `$CLOG_PATH` - Log directory (default: `$HOME/Library/Logs/clog`)
- `$CLOG_TAG` - Log tag prefix

**Troubleshooting:** If logs don't appear, check directory permissions for `$HOME/Library/Logs/clog`.

### ccombo - Advanced file combiner
Combines files based on .combosource with .comboignore support. Respects .gitignore.

**Usage:**
```bash
ccombo add path/to/file    # Add to .combosource
ccombo ignore "*.log"      # Add to .comboignore  
ccombo output.txt          # Generate combined file
```

### combo - Simple directory combiner
Basic file combiner for single directories.

**Usage:**
```bash
combo source_folder output.txt
```

### dockreset - Docker environment reset
Completely resets docker-compose environments including volumes and bind mounts.

**Usage:**
```bash
dockreset /path/to/compose-folder
```

**Troubleshooting:** Requires docker-compose.yml in target directory. Check Docker daemon is running.

### plistprefs - macOS preferences management  
Extract and manage app preferences via .settings files.

**Usage:**
```bash
plistprefs add "Visual Studio Code"     # Extract preferences
plistprefs add com.apple.finder         # Extract by bundle ID
plistprefs update                       # Sync with current system
plistprefs write                        # Apply to system
```

**Troubleshooting:** If app not found, use bundle ID directly. Settings stored in `$HOME/.config/plists/`.

## Troubleshooting
- Ensure `$HOME/.local/bin` is in PATH
- For permission issues: `chmod +x $HOME/.local/bin/*`
- For gitversion: Set `export GITHUBPATH=/path/to/github/repos`

### words - Generate test file
Creates a file with random words.

**Usage:**
```bash
words                                   # Generates test.txt filled with 25 words
words file.txt                          # Generates file.txt filled with 25 words
words file.txt 100                      # Generates file.txt filled with 100 words 
```
