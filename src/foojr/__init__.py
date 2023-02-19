# make an example python project and try to:
# build it as a wheel
# convert that wheel to a conda package

import ctypes
import os

# file is here with this script:
dll_dir = os.path.dirname(__file__)
dll_path = os.path.join(dll_dir,'foo.dylib')

if not os.path.isfile(dll_path):
    # if it was installed via conda, it was moved to lib folder:
    # HOW TO GET THIS FOLDER IN A CROSS-PLATFORM WAY??
    conda_prefix = os.environ['CONDA_PREFIX']
    dll_path = os.path.join(conda_prefix,'lib','foo.dylib')

lib = ctypes.CDLL(dll_path)

# interface:
lib.foo.argtypes = []
lib.foo.restype = ctypes.c_int

def foo():
    """test routine to call"""
    return lib.foo()
