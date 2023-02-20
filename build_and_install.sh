#!/bin/bash

# run the whole process from scratch
# see also README.md

rm -rf ./myenv 
rm -rf ./conda-output
rm -rf ./build-output
rm -rf ./src/dist 
rm -rf ./src/*.egg-info

mamba env create --prefix ./myenv -f ./environment.yml

conda activate ./myenv

gfortran --shared ./src/foojr/foo.f90 -o ./src/foojr/foo.dylib

python -m build ./src --outdir ./build-output 

# specify platform ??
# doesn't work... get "is not a supported wheel on this platform" error ... 
# python -m build ./src --outdir ./build-output -w -C="--global-option=--plat-name" -C="--global-option=osx-arm64"

conda build ./conda-recipe --output-folder conda-output
conda build purge
conda install ./conda-output/osx-arm64/foojr-0.0.1-py39_1.tar.bz2

