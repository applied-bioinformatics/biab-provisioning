#!/bin/bash

set -e

source activate ./iab-env
biab s3upload -i built-s3 -v latest
