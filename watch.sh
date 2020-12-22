#!/bin/bash

_obsidian_metadata="$HOME/Library/Application Support/obsidian/obsidian.json"

_id_value_for_open_vault=$(gron "$_obsidian_metadata" |
    rg 'open' |
    rg '[a-zA-Z0-9]{16}' --only-matching)

_path_for_open_vault=$(gron "$_obsidian_metadata" |
    rg "$_id_value_for_open_vault" |
    rg "path" |
    rg '((?:/\w+)+)' --only-matching)

# shellcheck disable=SC2016
fswatch -e ".*" -Ei "^.*(manifest\.json|styles\.css|main\.js)$" . |
    _path_for_open_vault=$_path_for_open_vault \
        gxargs -n1 -I {} \
        /bin/sh -c \
        '
            cd "$(dirname {})";
            echo "==> $(basename {}) updated, copying to Obsidian vault plugin dir..."
            cp {} "$_path_for_open_vault"/.obsidian/plugins/replicon/"$(basename {})";
            echo "==> Done."
        '
