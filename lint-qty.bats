
setup() {
  load '../test_helper/bats-assert/load'
  load '../test_helper/bats-support/load'
  # Set the directory to check for duplicates
  #DART="/Users/hkershaw/DART/pull_requests/pull_726"
  DART="/Users/hkershaw/DART/Projects/Developer_tests/bats-play/DART.gold"
  DIRECTORY_TO_CHECK=$DART"/assimilation_code/modules/observations"
}


@test "Check for duplicate lines containing 'QTY' in files" {
  run  ./duplicates.py $DIRECTORY_TO_CHECK
  [ "$status" -ne 0 ] && fail "duplicates.py script failed"
  refute_output --partial "Duplicate lines containing 'QTY' found"
}