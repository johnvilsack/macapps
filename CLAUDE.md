# Git Workflow Protocol

## Initial Setup
1. **Codebase Analysis:** Read entire `bin/` directory and `install.sh` to understand the codebase
2. **Consultation:** Ask for suggestions to optimize workflow token efficiency before proceeding

## Required Actions
- NEVER push directly to `main`
- ALWAYS use `gitversion` command instead of manual git operations
- ALWAYS create feature branches: `feature/desc` or `bugfix/desc`
- ALWAYS open PRs to merge to `main`

## gitversion Command
**Syntax:** `gitversion "<PREFIX>: <MESSAGE>"`

**Prefixes:**
- `RELEASE`/`MAJOR`/`BREAKING` → x.x.x → 1.0.0 (creates release tag)
- `FEATURE`/`MINOR` → x.x.x → x.1.0 (creates tag) 
- `FIX`/`PATCH` → x.x.x → x.x.1 (no tag)
- No prefix → x.x.x-1 (subversion)

**Auto-handles:** version increment, commit, push, tagging, changelog updates

**Message format:** `"TITLE\n\nBODY\n\t- Item 1\n\t- Item 2"`

## Workflow Steps
1. **Start:** Create branch from `main`
2. **Develop:** Commit frequently with `gitversion`
3. **Sync:** `git fetch origin && git rebase origin/main` before PR
4. **Review:** Open PR, wait for approval
5. **Complete:** Merge via PR only
6. **Cleanup:** Switch to `main`, pull, delete feature branch

## Multi-Branch Work
- Before each `gitversion`: Ensure branch is rebased on latest `main`
- Work on multiple branches freely, but commit to each in sequence
- Avoid parallel commits that could create version race conditions

## Error Handling
- If `gitversion` fails: Stop and ask for guidance
- If rebase conflicts occur: Resolve conflicts, test, then continue
- If uncertain about version sequencing: Ask before proceeding

## Version File Authority
- Only edit `.version` and `CHANGELOG.md` for race conditions or sequencing issues
- Current `.version` = version before next commit (gitversion handles increment)

## README Updates
- Follow existing README structure, formatting, and tone
- Update only when changes affect user-facing functionality

## Testing
- Test work before PR
- Fix conflicts during rebase
