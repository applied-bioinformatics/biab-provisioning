#!/bin/sh

set -e

# Configure git
git config --global user.name iabb8
git config --global user.email "gregcaporaso+iabb8@gmail.com"

cp iab-source/Dockerfile updated-built-iab/
cp iab-source/environment.yml updated-built-iab/

cd updated-built-iab
git add .
git diff-index --quiet HEAD || git commit -m "Updated rendered notebooks."
