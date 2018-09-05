#!/bin/sh

set -e

git clone ./built-iab ./updated-built-iab

source activate ./iab-env
biab notebook -i iab-source -o updated-built-iab/IAB-notebooks
