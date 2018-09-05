#!/bin/bash

set -e

git clone ./built-iab ./updated-built-iab

conda env create -q -p ./iab-env --file iab-source/environment.yml
source activate ./iab-env
pip install --quiet ./iab-source
pip install --quiet ./build-iab

biab notebook -i iab-source -o updated-built-iab/IAB-notebooks
