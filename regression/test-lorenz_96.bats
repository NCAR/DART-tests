load reg-utils.bash

setup_file() {
  export DART=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART
  export GOLD=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART.gold
  export model=lorenz_96
}

# teardown_file is called after all tests
teardown_file() {
    clean_model $model  
}

@test "compile lorenz 96" {
  compile_model $model gfortran
}

@test "bitwise lorenz 96" {
  load check-diffs-lorenz96.sh
  cd $DART/models/$model/work
  ./filter
  checkdiffs . $GOLD/models/$model/work
}
