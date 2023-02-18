**WORK IN PROGRESS!**

Trying to build a simple Python package that includes one or more shared libs (compiled with Fortran) that will depend on other libs installed by conda.

Initially trying to do this via an intermediate wheel format...

Testing this on an M1 Mac...

## How to build

Need these two packages in your environment:
```
conda install -c conda-build
conda install -c conda-forge build
```

### Build shared lib:

```
gfortran --shared ./foojr/foo.f90 -o ./foojr/foo.so
```

**TODO** add an MKL dependency or something like that

### Build wheel:

```
python -m build
```

### Build conda package:

```
conda build .
```

*Question: how to get this to be built in a local temp dir, rather than inside the `conda-bld` folder in the environment?*

To clean up conda-build process?: `conda build purge`

### make a conda env:

```
conda env create --prefix ./myenv -f ../environment.yml
conda activate ./myenv
```

install it (copied it from `<conda install>/conda-bld/osx-arm64/foojr-0.0.1-py39_1.tar.bz2` to local dir first)
```
conda install ./foojr-0.0.1-py39_1.tar.bz2
```

# Current status...

* wheel can be pip installed, and it works.
* conda package can be installed, but the `.so` file isn't being copied over...

# References

* [Managing environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#create-env-file-manually)
* [Using wheel files with conda](https://docs.conda.io/projects/conda-build/en/stable/user-guide/wheel-files.html)
* [Using shared libraries](https://docs.conda.io/projects/conda-build/en/stable/resources/use-shared-libraries.html)
* [Building conda packages from scratch](https://docs.conda.io/projects/conda-build/en/stable/user-guide/tutorials/build-pkgs.html#writing-the-build-script-files-build-sh-and-bld-bat)