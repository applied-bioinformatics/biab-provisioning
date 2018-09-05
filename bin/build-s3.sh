#!/bin/bash

set -e

conda env create -q -p ./iab-env --file iab-source/environment.yml
source activate ./iab-env
pip install --quiet ./iab-source
pip install --quiet ./build-iab

biab s3build -i iab-source/book -o built-s3
