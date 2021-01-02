#!/usr/bin/env just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

_default:
    @just --list --unsorted

# get the project setup
install: hookup
    @echo "==> Installing dependencies..."
    @npm install --no-fund
    @echo "==> Dependencies successfully installed."

# setup pre-commit hooks for the project
hookup:
    @echo "==> Setting up hooks..."

    @echo "==> Removing old hooks, linking hooks to the proper location..."
    find .git/hooks -type l -exec rm {} \
        find .githooks -type f -exec  ln -sf ../../{} .git/hooks \;

    @echo "==> Git hooks successfully created."

# compile project continuously in the background for development
dev: install
    @echo "==> Compiling project for development..."
    npx concurrently \
        "rollup --config rollup.config.js -w" \
        "npx postcss src/style/main.css -o dist/styles.css --watch" \
        "./scripts/watch.sh"

# build the project
build:
    npx rollup --config rollup.config.js
    npx postcss src/style/main.css -o dist/styles.css

# format the files that match the FILE_PATTERN
format FILE_PATTERN:
    npx prettier --write {{FILE_PATTERN}}

# lint the files that match the FILE_PATTERN
lint FILE_PATTERN:
    npx eslint {{FILE_PATTERN}}

# clean out project build artifacts/caches
clean:
    @echo "==> Cleaning out artifacts..."
    rm -rf ./dist
    rm -rf ./node_modules
    @echo "==> Cleanup done."