## Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/johnvilsack/macapps/refs/heads/main/install-local.sh | bash
```

## plistprefs
"add" to write ~/.config/plists/FILE.settings of plists in system for app
"update" to get any changed values
"write" writes .settings file to defaults write

## gitversion (0.1.0)
auto versioning for repos

Usage:
  gitversion                           - Commit current repo with 'simple changes'
  gitversion "message"                 - Commit current repo with custom message
  gitversion reponame "message"        - Commit remote repo with custom message

Version prefixes (case-insensitive):
  major|release|breaking: <message>   - Bumps major version
  minor|feature|feat: <message>       - Bumps minor version
  patch|fix: <message>                - Bumps patch version

## clog
Pretty printing for logging

clog and pclog

Levels
  INFO        Informational messages (blue)
  WARNING     Warning messages (yellow)
  ERROR       Error messages (red)
  SUCCESS     Success messages (green)
  DEBUG       Debug messages (magenta)
  TRACE       Trace messages (cyan)

Args
  -h, --help          Show this help message
  -v, --version       Show version information
  -t, --timestamp     Include timestamp in output
  -p, --pid           Include process ID in output
  -j, --json          Output in JSON format
  -n, --no-syslog     Don't log to syslog
  -c, --no-color      Disable colored output
  --tag TAG           Set syslog tag (default: clog)

Vars
  CLOG_TAG           Default syslog tag
  NO_COLOR           Disable colors if set
  CLOG_NO_SYSLOG     Disable syslog if set

clog INFO -t -j "Hello world"
