#!/bin/bash
export PYCVODES_LAPACK=lapack,blas

# Sundials 2.7:
#export PYCVODES_SUNDIALS_LIBS=sundials_cvodes,sundials_nvecserial

# Sundials 3.x:
export PYCVODES_SUNDIALS_LIBS=sundials_cvodes,sundials_nvecserial,sundials_sunlinsollapackdense,sundials_sunlinsollapackband,sundials_sunlinsolklu

cat <<EOF>pycvodes/_config.py
env = {
    'LAPACK': "${PYCVODES_LAPACK}",
    'SUNDIALS_LIBS': "${PYCVODES_SUNDIALS_LIBS}",
    'NO_KLU': '0'
}
EOF
export PYCVODES_STRICT=1
python -m pip install --no-deps --ignore-installed . -vv
