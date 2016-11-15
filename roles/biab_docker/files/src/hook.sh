#!/bin/bash

LOCKF="/tmp/iab"
IAB="/opt/biab/An-Introduction-To-Applied-Bioinformatics"
BUILD="/tmp/iab-build"

lockfile-create $LOCKF --use-pid

cd $IAB
git pull origin master > /dev/null

node -e "console.log('[' + Date() + '] - Creating env');"
conda env remove -y -n iab > /dev/null
conda create -y -n iab -c https://conda.anaconda.org/biocore python=3.5 --file ci/conda_requirements.txt > /dev/null
source activate iab
pip install -r ci/pip_requirements.txt > /dev/null
pip install https://github.com/caporaso-lab/build-iab/archive/master.zip > /dev/null
pip install . --no-deps > /dev/null

#Hack:
cat /opt/biab/hack.txt /opt/conda/envs/iab/lib/python3.5/site-packages/biab/s3.py > /opt/conda/envs/iab/lib/python3.5/site-packages/biab/s3_2.py
mv  /opt/conda/envs/iab/lib/python3.5/site-packages/biab/s3_2.py /opt/conda/envs/iab/lib/python3.5/site-packages/biab/s3.py


node -e "console.log('[' + Date() + '] - Constructing IAB');"
rm -rf $BUILD
biab s3build -i book -o $BUILD
biab notebook -i book -o $BUILD/IAB-notebooks

cd $BUILD
zip IAB-notebooks.zip IAB-notebooks -rm

node -e "console.log('[' + Date() + '] - Uploading IAB to latest');"
biab s3upload -i $BUILD -v latest

lockfile-remove $LOCKF
