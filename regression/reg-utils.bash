# Function to compile filter for a given model
# # Arguments:
#   $1 - model name (e.g., "lorenz_96")
#   $2 - compiler name ("gfortran" or "ifort")
compile_model() {

  if [ "$#" -ne 2 ]; then
    echo "Error: usage compile_model [model] [compiler]."
    return 1
  fi

  declare -A compiler_dict

  compiler_dict["gfortran"]="mkmf.template.gfortran"
  compiler_dict["ifort"]="mkmf.template.intel.linux"

  local model=$1
  local compiler=$2
  cd $DART/build_templates/
  cp ${compiler_dict["$compiler"]} mkmf.template
  echo "NETCDF=/opt/local" >> mkmf.template
  cd $DART/models/$model/work
  ./quickbuild.sh filter
}

# Function to clean up the build for a given model
# # Arguments:
#   $1 - model name (e.g., "lorenz_96")
clean_model() {

  if [ "$#" -ne 1 ]; then
    echo "Error: usage clean_model [model]."
    return 1
  fi

  local model=$1
  cd $DART/models/$model/work
  ./quickbuild.sh clean
}