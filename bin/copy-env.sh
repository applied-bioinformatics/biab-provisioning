#!/bin/bash

set -e

git clone ./updated-built-iab ./final-built-iab

# Configure git
git config --global user.name iabb8
git config --global user.email "gregcaporaso+iabb8@gmail.com"

cp iab-source/Dockerfile.template final-built-iab/Dockerfile
cp iab-source/environment.yml final-built-iab/

cd final-built-iab
git add .
git diff-index --quiet HEAD || git commit -m "Updated rendered notebooks."
