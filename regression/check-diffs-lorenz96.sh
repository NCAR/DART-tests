#!/usr/bin/env bash

# Example usage:
# checkdiffs /path/to/dir1 /path/to/dir2

checkdiffs() {
  local dir1=$1
  local dir2=$2

  netcdffiles=(\
    analysis.nc
    filter_input.nc
    filter_output.nc
    perfect_input.nc
    pmo_input_member_0001.nc
    preassim.nc \
  )

  for f in "${netcdffiles[@]}" 
  do 
    echo -n $f " "  
    nccmp -d $dir1/$f $dir2/$f  
    echo "" 
  done 
 
  diff -s $dir1/obs_seq.final $dir2/obs_seq.final
}

