#!/bin/sh

set -e

source activate ./iab-env
biab s3build -i iab-source -o built-s3
