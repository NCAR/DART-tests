setup() {
  DART=/Users/hkershaw/DART/Projects/NumericalComp/DART
  cd $DART/build_templates/
  cp mkmf.template.gfortran mkmf.template
  echo "NETCDF=/opt/local" >> mkmf.template
}

@test "normal_dist" {
  cd $DART/developer_tests/normal_dist/work
  ./quickbuild.sh
  ./test_normal_dist > out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 17 ]
  fail_count=$(grep -o "FAIL" out | wc -l)
  [ "$fail_count" -eq 0 ]
}

@test "beta_dist" {
  cd $DART/developer_tests/beta_dist/work
  ./quickbuild.sh
  ./test_beta_dist | tee out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 2 ]
  fail_count=$(grep -o "FAIL" out | wc -l)
  [ "$fail_count" -eq 0 ]
}

@test "kde_dist" {
  cd $DART/developer_tests/kde_dist/work
  ./quickbuild.sh
  ./test_kde_dist | tee out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 16 ]
  fail_count=$(grep -o "FAIL" out | wc -l)
  [ "$fail_count" -eq 0 ]
}

@test "gamma_dist" {
  cd $DART/developer_tests/gamma_dist/work
  ./quickbuild.sh
  ./test_gamma_dist | tee out
  pass_count=$(grep -o "PASS" out | wc -l)
  [ "$pass_count" -eq 2 ]
  fail_count=$(grep -o "FAIL" out | wc -l)
  [ "$fail_count" -eq 0 ]
}


teardown() {
  ./quickbuild.sh clean
}