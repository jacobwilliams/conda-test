# make an example python project and try to:
# build it as a wheel
# convert that wheel to a conda package

import ctypes
import os 

dll_dir = os.path.dirname(__file__)
lib = ctypes.CDLL(os.path.join(dll_dir,'foo.dylib'))

# interface:
lib.foo.argtypes = []
lib.foo.restype = ctypes.c_int

def foo():
    """test routine to call"""
    return lib.foo()
