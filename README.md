# Replicon

I wanted to create a plugin that themed the interface, changed the icons being used, and provided some minor customization options, all in the same repo. And thus, this project was born!

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

### Contributing

#### Pre-requisite Tooling

- `node` v12.18.4 / `npm` v6.14.6 (minimum)
- [`just`](https://github.com/casey/just)
- [`cliclick`](https://github.com/BlueM/cliclick)

#### Developing

- Clone this repo.
- `$ just install` (sets up the project locally)
- `$ just run` (develop develop develop)

#### Project Structure

- Rollup is used to compile the `src/ts/main.ts` to `dist/main.js`
- PostCSS is used in this project. Files are compiled from `src/style/main.css` into `dist/styles.css`.
- This project uses Tailwind via [`@apply` directives](https://v1.tailwindcss.com/docs/functions-and-directives#apply); regular CSS is to be avoided wherever possible
- `just run` compiles everything properly **_on macOS_**, and will also automatically copy over your files to your open vaults under `$VAULT/.obsidian` via the `scripts/watch.sh` file. Copied files as this time are `dist/main.js`, `dist/styles.css`, and `manifest.json`.
    - CSS is compiled and copied over to `$VAULT/.obsidian/snippets/replicon.css` (the interface doesn't need to be refreshed if you place it here)
    - JS is compiled and copied over to `$VAULT/.obsidian/plugins/replicon/main.js`
    - I haven't done any optimization for other OS's, and don't plan to, but feel free to PR if you want to help out!

### Why a plugin when this is mostly a theme?

Because it allows me to keep the theme and plugin code all in one spot. Note that this will clash with whatever styling you currently have, so feel free to set your "Theme" to "None" - it should still continue to work.

### API Documentation

See https://github.com/obsidianmd/obsidian-api
