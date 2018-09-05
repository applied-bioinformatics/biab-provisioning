#!/bin/sh

set -e

conda create -q -y -n iab python
conda activate iab
pip install --quiet ./build-iab

biab s3upload -i built-s3 -v latest
