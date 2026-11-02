# crdir

Create a path and set who can use it.

crdir creates a directory or fixes an existing file, then sets owner, group, mode, setgid, and an ACL. One call. Apache and the deploy user can both use the result.

## Install

```sh
git clone https://github.com/landNull/crdir.git
```

```sh
cd crdir
```

```sh
./install.sh
```

The binary lands at `/usr/local/bin/crdir`. The man page lands at `/usr/local/share/man/man1/crdir.1`.

## Use

```sh
crdir -s -o www-data -g www-admin /srv/platforms/ecom/files/site
```

```sh
crdir -o deploy -g www-admin -m 0640 /srv/platforms/ecom/web/sites/site/settings.local.php
```

A file is not created as a directory. A directory also fixes the files already inside it.

## Contract

- Does not call bare `sudo`. It uses `sudo -n andromeda-priv`.
- `andromeda-priv setacl` grants `deploy`, `www-admin`, and `www-data`.
- A directory gets a default ACL so a file created later keeps the same rights.
