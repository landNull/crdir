# crdir reference

## Flags

| Flag | Meaning | Default |
|---|---|---|
| `-o` | Owner | `deploy` |
| `-g` | Group | `www-data` |
| `-m` | Mode, octal | `0770` |
| `-s` | Setgid on a directory | off |
| `-n` | Print the plan, change nothing | off |
| `-h` | Help | |

## What one call does

1. If the path is missing and is meant to be a directory, `mkdir -p`.
2. If the path is a file, do not `mkdir`.
3. `chown owner:group`.
4. `chmod mode`.
5. Setgid when `-s` and the path is a directory.
6. `andromeda-priv setacl`: `deploy`, the group, and `www-data`.
7. On a directory, a default ACL so a new file inherits.
8. On a directory, the same owner and ACL on the files already inside.

## What it does not do

- It does not call bare `sudo`.
- It does not create a file. A missing file is a directory.
- It does not touch a path outside `/srv/platforms`, `/srv/andromeda`, or `/srv/git`. That check lives in `andromeda-priv`.
