#!/bin/bash

# install using pip from the whl file 

#.... can we make this a local path???
# pip install ~/git/conda-test/src/dist/foojr-0.0.1-py3-none-any.whl --no-deps

#... this does work, seems like we should have an env var for src somewhere?
# (does it work on windows?)
pip install ${RECIPE_DIR}/../src/dist/foojr-0.0.1-py3-none-any.whl --no-deps
