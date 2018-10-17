check_agent mac_sierra_vanilla

check_agent(){
  if ! [ -f $1.txt ]; then
    launchctl list | awk '{print $3}' > $1.txt  
  fi
  
  launchctl list | awk '{print $3}' > temp; 
  diff $1.txt temp # > overflow;
  rm -rf temp;
}

