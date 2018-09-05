#!/bin/bash

set -e

apt-get install xvfb x11-utils

conda env create -q -p ./iab-env --file iab-source/environment.yml
source activate ./iab-env
pip install --quiet ./iab-source
pip install --quiet ./build-iab

xvfb-run biab s3build -i iab-source/book -o built-s3
