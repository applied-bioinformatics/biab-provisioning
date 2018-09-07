#!/bin/bash

set -e

conda create -q -y -p ./iab-env python=3.5
source activate ./iab-env
pip install --quiet ./build-iab

biab s3upload -i built-s3 -v test
