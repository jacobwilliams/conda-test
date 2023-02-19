#!/bin/bash

# install using pip from the whl file 

#.... can we make this a local path???
# pip install ~/git/conda-test/src/dist/foojr-0.0.1-py3-none-any.whl --no-deps

# echo "!!!!! build.sh !!!!!!"
# # https://docs.conda.io/projects/conda-build/en/latest/user-guide/environment-variables.html
# echo $CONDA_PREFIX
# echo $RECIPE_DIR
# echo $PKG_NAME
# echo ""
# echo ${PREFIX}
# echo ${LD_RUN_PATH}
# echo ${RECIPE_DIR}
# echo ${PKG_CONFIG_PATH}
# echo ${SP_DIR}
# echo "!!!!!!!!!!!!!!!!!!!!"

#... this does work, seems like we should have an env var for src somewhere?
# (does it work on windows?)
pip install ${RECIPE_DIR}/../build-output/foojr-0.0.1-py3-none-any.whl --no-deps

# move to conda lib directory ..... ??? is it ok to do this ???
# note: this lib directory also has to be found in the python code in the library
# see __init__.py
mv $SP_DIR/$PKG_NAME/foo.dylib $PREFIX/lib/foo.dylib

# see:
# https://ipscc.readthedocs.io/en/latest/build-sh-guidelines.html