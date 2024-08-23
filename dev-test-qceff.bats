setup() {
  DART=/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART
  cd $DART/build_templates/
  cp mkmf.template.gfortran mkmf.template
  echo "NETCDF=/opt/local" >> mkmf.template
  cd $DART/developer_tests/qceff/work
  ./quickbuild.sh
}

@test "qceff" {
  cd $DART/developer_tests/qceff/work
  ./runall.sh > out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 14 ]
    fail_count=$(grep -o "FAIL" out | wc -l)
    [ "$fail_count" -eq 0 ]
}

