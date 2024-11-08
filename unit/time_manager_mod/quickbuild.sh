#!/usr/bin/env bash

# DART software - Copyright UCAR. This open source software is provided
# by UCAR, "as is", without charge, subject to all terms of use at
# http://www.image.ucar.edu/DAReS/DART/DART_download

main() {


export DART="/Users/hkershaw/DART/pull_requests/pull_767/DART"
source "$DART"/build_templates/buildfunctions.sh

MODEL="none"
EXTRA="$DART"/models/template/threed_model_mod.f90
dev_test=1
TEST="io"
LOCATION="threed_sphere"

serial_programs=(
test_calendar_string
)

# quickbuild arguments
arguments "$@"

# clean the directory
\rm -f -- *.o *.mod Makefile .cppdefs

# build any NetCDF files from .cdl files
cdl_to_netcdf

# build and run preprocess before making any other DART executables
buildpreprocess

# build 
buildit

# clean up
\rm -f -- *.o *.mod

}

main "$@"
