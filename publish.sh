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

date_str=`date '+CV updated at %Y-%m-%d %H:%M:%S %z'`

git add . -A
git commit -m "$date_str"
git push -u origin master

cd ..
git add . -A
git commit -m "$date_str"
git push -u origin master
