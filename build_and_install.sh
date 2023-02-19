#!/bin/bash

# run the whole process from scratch
# see also README.md

rm -rf ./myenv 
rm -rf ./outdir
rm -rf ./src/dist 
rm -rf ./src/*.err-info

mamba env create --prefix ./myenv -f ./environment.yml

conda activate ./myenv

gfortran --shared ./src/foojr/foo.f90 -o ./src/foojr/foo.dylib

python -m build ./src

conda build ./conda-recipe --output-folder outdir
conda build purge
conda install ./outdir/osx-arm64/foojr-0.0.1-py39_1.tar.bz2

