load reg-utils.bash

# setup_file is called once for the file
setup_file() {
  export DART=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART 
  export model=wrf 
}

# teardown_file is called after all tests
teardown_file() {
    clean_model $model  
}

@test "compile wrf" {
  compile_model $model gfortran
}

