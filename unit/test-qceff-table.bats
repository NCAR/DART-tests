setup() {
  DART=/Users/hkershaw/DART/Projects/NumericalComp/DART
  cd $DART/build_templates/
  cp mkmf.template.gfortran mkmf.template
  echo "NETCDF=/opt/local" >> mkmf.template
}

@test "qceff" {
  cd $DART/developer_tests/qceff/work
  ./quickbuild.sh
  ./runall.sh > out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 14 ]
  fail_count=$(grep -o "FAIL" out | wc -l)
  [ "$fail_count" -eq 0 ]
}

teardown() {
  ./quickbuild.sh clean
}