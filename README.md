# Replicon

Obsidian is great, but I wanted a different set of icons for the interface. Instead of trying to petition the developers, I decided to try to do it myself.

This is a WIP, and will be under on-and-off development. Don't expect anything in here to work until I do a 1.0.0 release.

## Setup

Run `just` to see available recipes:

```
$ just
Available recipes:
    install             # get the project setup
    hookup              # setup pre-commit hooks for the project
    run                 # concurrently run Rollup and copy files to Obsidian vault locations
    format FILE_PATTERN # format the files that match the FILE_PATTERN
    lint FILE_PATTERN   # lint the files that match the FILE_PATTERN
```

### Pre-requisites

- `node` v12.18.4 / `npm` v6.14.6 (minimum)
- [`just`](https://github.com/casey/just) / [`watchexec`](https://github.com/watchexec/watchexec)

### Develop

- Clone this repo.
- `just install` (sets up the project locally)
- `just run`
    - This will compile everything properly, and will also automatically copy over your files to your open vaults under `$VAULT/.obsidian/plugins/replicon/`. Copied filed as this time are `main.js`, `styles.css`, and `manifest.json`.

### API Documentation

See https://github.com/obsidianmd/obsidian-api
