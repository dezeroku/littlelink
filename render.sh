#!/usr/bin/env bash

# Take index.html and replace vars:
# * %NAME%
# * %EMAIL%
# * %WEBSITE%
# with provided values

function usage() {
    echo "render.sh NAME EMAIL WEBSITE"
    exit 1
}

if [[ $# -ne 3 ]]; then
    usage
fi

script_dir="$(readlink -f "$(dirname "$0")")"

name="$1"
email="$2"
website="$3"

sed \
    -e 's#%NAME%#'"$name"'#g' \
    -e 's#%EMAIL%#'"$email"'#g' \
    -e 's#%WEBSITE%#'"$website"'#g' < "$script_dir"/index.html
