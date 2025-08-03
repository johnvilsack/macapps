1. Read through my entire bin/ and install.sh in ultrathink and generate a full, working understanding of this codebase.
2. Update the README mimicing the existing format of simplicity over verboseness. You may modify existing entries but must keep the install at the top. Please modify it to include the other applications. No emojiis please.
3. Generate a new file called NEWCLAUDE.md and generate a new CLAUDE.md file that you would use in the future to best prepare yourself to manage this repo. The goal of this repo is to create scripts that run as commands on MacOS (and potentially Linux) to augment user effeciency. The contents of that file will replace the existing contents here.
4. Before beginning, I want you to prompt me with any suggestions you may have of what else to include to make this as meaningful as possible in the fewest amount of tokens needed.
5. Below is the suggested workflow I have for you. Please let me know your thoughts, if I should make any changes,additions, or removals.
6. Where I reference below the code inside gitversion, please modify the workflow to display the values you source, instead of forcing it to read the code every time. You should create a list of the values so you know what to add.

# Git workflow for feature development

## On each feature request:
- Make a new branch: `feature/xxx-desc` off `main` and switch to it.
- Commit often: prepend messages based on the keywords (or in the case of subversion, lackthereof) identified in gitversion
- ALWAYS use gitversion command instead of manual git commands
  - gitversion automatically handles all these tasks in one command:
    - Version iteration (based on .version)
    - Injection of version into commit title
    - git add .
    - git commit
    - git push origin HEAD
    - Tag creation (based on versioning need) and pushing
    - Version file updates
    - Changelog updates
  - gitversion
    - Syntax
      - gitversion "<PREFIX>: <COMMIT MESSAGE>"
    - Prefixes (First entry for each is the preferred one)
      - RELEASE, MAJOR, BREAKING - Breaking change or major version update (x.x.x → 1.0.0 creates release tag)
      - FEATURE, MINOR - New features or signifigant reworks/refactors (x.x.x → x.1.0 creates tag)
      - FIX, PATCH - Fixes or minor reworks/refactors (x.x.x → x.x.1 no tag created)
      - no prefix - Creates subversion (x.x.x-1)
    - Message honors escape characters: /n /t
    - Preferred format <TITLE>\n\n<BODY LINE 1>\n\t- <Indented List 1>\n\t- <Indented List 2>, etc."
  - Examples
    - gitversion "FEATURE: Add new functionality\nNew functionality added for tagging images includes:\n\t- How it works 1\n\t- How it works 2"
    - gitversion "FIX: Resolve critical bug"
- Test your work or ask me to test whatever you need validated
- You may work on multiple features and use multiple branches if you remain in accordance with the criteria below.

## Keep branches up‑to‑date:
- Before final review, `git fetch origin && git rebase origin/main` if required to satisfy the following:
  - Run tests and fix conflicts
  - Ensure that versioning happens correctly and in sequence
  - You are authorized to edit the .version and CHANGELOG.md files only if:
    - For some reason, your manipulation of the repo causes an out-of-sequence or race condition with versioning
    - Things are entered out-of-order
    - Keep in mind that the current .version number represents the version prior to you making your next add and commit. You should never change it to represent the version that you are working on now. That happens automatically with the gitversion command.
  - In the event that you want to rollup your changes and iterate the current version based on that collection, you are authorized to perform a gitversion command without modifying any files. gitversion will always modify the .version and CHANGELOG before pushing, so files will always be added and committed.

## When ready:
- Open a Pull Request to `main`  
- Wait for approvals
- Merge only through PR (never `git merge` directly to main)

## After merge approval:
- Switch to `main`, `git pull`

## If a new feature updates past code:
- Rebase feature branch on latest `main`
- Fix, test, gitversion, and PR again

## Branch naming:
- Branch names: `feature/short‑desc‑or‑ticket` or `bugfix/xyz`

## On completion:
- Look at local and remote branches
- Remove branches as appropriate
- Ask for confirmation if branch may needed in the future

Claude follows this and never pushes directly to `main`—it always creates a branch, pushes to remote, rebases, opens a PR, and tags after—ensuring full tracking.
