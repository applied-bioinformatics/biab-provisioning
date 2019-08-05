#!/bin/bash

set -e

git clone ./built-iab ./updated-built-iab
apt-get install -y -q xvfb x11-utils

conda env create -q -p ./iab-env --file iab-source/environment.yml
source activate ./iab-env
pip install --quiet ./iab-source
pip install --quiet ./build-iab

# Does not execute cells
biab notebook -i iab-source/book -o updated-built-iab/IAB-notebooks

xvfb-run biab s3build -i iab-source/book -c iab-source/custom.css -o built-s3
