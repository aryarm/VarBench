#!/usr/bin/env bash

mkdir "$1" && cd "$1"

### SV truthset and index ###
echo "downloading SV truthset from ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son..."
mkdir -p truthset && cd truthset

wget -r -e robots=off -np -R "index.html*" --cut-dirs=6 https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NIST_SV_v0.6/
echo "done"

### Short variant truthset and index ###
echo "downloading SV truthset from ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son..."

wget -r -e robots=off -np -R "index.html*" --cut-dirs=6 https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/AshkenazimTrio/HG002_NA24385_son/NISTv4.2.1/

echo "done"
