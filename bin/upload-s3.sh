#!/bin/sh

set -e

conda env create -q -y -n iab python
source activate iab
pip install --quiet ./build-iab

biab s3upload -i built-s3 -v latest
