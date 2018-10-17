check_agent mac_sierra_vanilla

check_agent(){
  if ! [ -f $1.txt ]; then launchctl list | awk '{print $3}' > $1.txt; fi

  launchctl list | awk '{print $3}' > temp; 

  var=$(diff $1.txt temp) # > overflow

  check_empty "$var"
  rm -rf temp;
}

check_empty(){
  # check if empty
  if test -z "$1"; then
    echo "\$var is empty"
  else
    echo -e "\$var is NOT empty, here is var: \n$1";
  fi
}

# if option passed for insert new checkpoint..

# note for future implementation.
# for d in each * in dir
# check_agent $d

# otherwise ls-count
# num=$(ls -1 | wc -l | awk '{ print $1}')

# check_agent checkpoint$num

