1. Read through my entire bin/ and install.sh in ultrathink and generate a full, working understanding of this codebase.
2. Ensure that when ccombo executes its primary function, it honors .combosource, .comboignore and .gitignore and the types of globs that can appear within them. In terms of supersedence:
   1. .comboignore is top priority and overrides all others
   2. .combosource is next in line for priority, overriding
   3. .gitignore and any globs (formats) within
2. If generation encounters a nested .combosource file, honor any entries that are NOT part of the root filepath for this generation. This means we should be able to source files from outside the filepath if they are required even if these were possibly nested in a subfolder. All .comboignore files encountered should respect their entries for that filepath only.
3. Generation should never include the following UNLESS they are specifically included in the .combosource file:
   1. .git folders and their contents
   2. .gitignore files
   3. .gitattributes files
   4. node_modules folders
   5. .direnv folders
   6. __pycache__ folders
   7. .venv folders
   8. venv folders
   9. .npm folders
   10. .vscode folders
4. ccombo with no arguments in a folder with no .combosource should behave the same way as ccombo with no arguments in a folder with a .combosource file does except that it should prompt the user if they want to generate the file. It should then generate the output to a default text file upon y confirmation.
5. When adding files and folders to .combosource and .comboignore, check if the file path is $HOME, $GITHUBPATH and use these variables instead of the absolute path. Make sure the rest of the application can handle that.
