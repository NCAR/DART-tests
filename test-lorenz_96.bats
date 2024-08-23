
load setup_file.bash

# setup is called for every test
setup() {
  DART=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART
  GOLD=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART.gold
  
}

@test "compile lorenz" {
  cd $DART/build_templates/
  cp mkmf.template.gfortran mkmf.template
  echo "NETCDF=/opt/local" >> mkmf.template
  cd $DART/models/lorenz_96/work
  ./quickbuild.sh filter
}


@test "bitwise lorenz" {
  load check-diffs-lorenz96.sh
  cd $DART/models/lorenz_96/work
  ./filter
  checkdiffs . $GOLD/models/lorenz_96/work
}


