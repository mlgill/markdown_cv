#!/usr/bin/env zsh

# Example script to generate HTML and push to local gh-pages directory.

#build site from markdown
jekyll build

# re-add new
cp _site/*.html ../.
cp -R _site/media ../.
cp *.md ../markdown/.

if [[ -s ../markdown/README.md ]]; then
    rm ../markdown/README.md
fi

