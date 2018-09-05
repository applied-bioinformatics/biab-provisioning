#!/bin/sh

set -e

conda env create -q -n iab --file iab-source/environment.yml
source activate iab
pip install --quiet ./iab-source
pip install --quiet ./build-iab

biab s3build -i iab-source -o built-s3
