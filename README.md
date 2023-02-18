**WORK IN PROGRESS!**

Trying to build a simple Python package that includes one or more shared libs (compiled with Fortran) that will depend on other libs installed by conda.

Initially trying to do this via an intermediate wheel format...

Testing this on an M1 Mac...

### make a conda env:

```
conda env create --prefix ./myenv -f ./environment.yml
conda activate ./myenv
```


## How to build

### Build shared lib

```
gfortran --shared ./src/foojr/foo.f90 -o ./src/foojr/foo.dylib
```

**TODO** add an MKL dependency or something like that

### Build wheel:

```
python -m build ./src
```

### Build conda package:

```
conda build ./conda-recipe --output-folder outdir
```

To clean up conda-build process?: `conda build purge`

```
conda install ./outdir/osx-arm64/foojr-0.0.1-py39_1.tar.bz2
```

# Current status...

* wheel can be pip installed, and it works.
* conda package can be installed, and it works.
* need to add a shared lib dependency.... can/should the dylib be installed in the conda lib folder rather than with the package?

# References

* [Managing environments](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#create-env-file-manually)
* [Using wheel files with conda](https://docs.conda.io/projects/conda-build/en/stable/user-guide/wheel-files.html)
* [Using shared libraries](https://docs.conda.io/projects/conda-build/en/stable/resources/use-shared-libraries.html)
* [Building conda packages from scratch](https://docs.conda.io/projects/conda-build/en/stable/user-guide/tutorials/build-pkgs.html#writing-the-build-script-files-build-sh-and-bld-bat)