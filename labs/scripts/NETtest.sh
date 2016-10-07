#!/bin/bash
gr="\e[1;32m"
rd="\e[1;31m"
def="\e[0m"

# Client-1 test
if [ `uname -n` == "client-1" ]
then
  printf "$gr%s$def\n" "hostname ok"
else
  printf "$rd%s$def\n" "hostname nok"
  #exit 1
fi

ping -c 1 130.236.178.153
if [ $? -eq 0 ]; then
  :
else
  printf "$rd%s$def\n" "Could not connect to gw (local, IP)."
  exit 1
fi

ping -c 1 130.236.178.17
if [ $? -eq 0 ]; then
  :
else
  printf "$rd%s$def\n" "Could not connect to gw (ext, IP)."
  exit 1
fi

ping -c 1 130.236.178.1
if [ $? -eq 0 ]; then
  :
else
  printf "$rd%s$def\n" "Could not connect to ida-gw (IP)."
  exit 1
fi


ping -c 1 ida-gw.sysinst.ida.liu.se
if [ $? -eq 0 ]; then
  :
else
  printf "$rd%s$def\n" "Could not connect to ida-gw (name resolved)."
  exit 1
fi

ping -c 1 www.google.com
if [ $? -eq 0 ]; then
  printf "$gr%s$def\n" "We have world-wide connectivity"
else
  printf "$rd%s$def\n" "No world-wide connectivity"
  exit 1
fi
