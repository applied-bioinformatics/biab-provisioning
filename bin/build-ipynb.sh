#!/bin/sh

set -e

git clone ./built-iab ./updated-built-iab

conda env create -q -y -n iab --file iab-source/environment.yml
source activate iab
pip install --quiet ./iab-source
pip install --quiet ./build-iab

biab notebook -i iab-source -o updated-built-iab/IAB-notebooks
