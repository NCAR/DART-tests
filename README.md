## Playground repo for DART tests


To clone:

git clone --recurse-submodules https://github.com/NCAR/DART-tests.git

BATS is a submodule

deps (dependency directory) 
 - fortran-testanythin
 - tapview

### Goals:
* regression tests for models
* regression tests for converters
* unit tests for modules

* Utility scripts:
  - lint as much as possible

### Methods:
* Test anything protocol, bats & fortran\_test\_anything & tapview

### Reference cases:

Initally collecting reference cases in

/glade/work/hkershaw/GarbageCollection


### Ideas: 
* link developer tests to dartlib - currently a lot of duplicated compiling

