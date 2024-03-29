#!/bin/bash
if [ $1 == "-h" ]; then
   echo -e "\n  CREATE FAKE APs 2024\n  Git:Peters0m\n\n  usage: nmkfakeAPs <options>[1~10]<options>\n\n  Options:\n  -i                   :input manual names\n  -r             <name>:repeat the name several times"
   exit 0
elif [ $1 != "-r" ] && [ $1 != "-i" ] || [ $2 -gt 10 ] || [ $2 -lt 1 ]; then
   echo "invalid argument type 'mkfakeAps -h'"
   exit 0
fi

echo -n > listfakeAPs.txt

for((mac=1;mac<=$2;mac++));
do
  if((mac<10)); then
     echo -n "00:00:00:00:00:0$mac " >> listfakeAPs.txt
  elif((mac>9)); then
     echo -n "00:00:00:00:00:$mac " >> listfakeAPs.txt
  fi
  if [ $1 == "-i" ]; then
     read _INPUT_STRING
     echo "$_INPUT_STRING" >> listfakeAPs.txt
  elif [ $1 == "-r" ]; then
     echo "$3$mac" >> listfakeAPs.txt
  else
     echo "fail not create list!"
     exit 0
  fi
done

echo "create list sucess!"
