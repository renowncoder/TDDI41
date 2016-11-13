#!/bin/bash
################################################################################
# TDDI41 2016 Main Script by oscpe262 and matla782
#
# This script is for TDDI41:b4 use only. No warranties - you are responsible for
# any consequence of not knowing what it does.
# This script is somewhat inspired by oscpe262's revamp of helmuthdu's Arch
# Ultimate Install , which can be found at https://github.com/helmuthdu/aui . ################################################################################

### Include Dependencies #######################################################
[[ ! -f common.sh ]] && echo -e "Missing dependency: common.sh" && exit 1
[[ ! -f tests.sh ]] && echo -e "Missing dependency: tests.sh" && exit 1
[[ ! -f configs.sh ]] && echo -e "Missing dependency: configs.sh" && exit 1
source common.sh
source tests.sh
source configs.sh

### Main variables #############################################################
checklist=( 0 0 0 )
testlist=( 0 0 0 )
configlist=( 0 0 0 )
maintitle="TDDI41 2016 Main Script by oscpe262 and matla782"

main(){
  print_title "${maintitle}"
}

### Welcome ####################################################################

main
print_info "Welcome! Make sure you have read the documentation before you proceed!"
echo -e "Prerequisites:\n"
echo ">> Environment set according to TDDI41 first four labs."
echo ">> UML:s running, with SSH active and connectable."
echo -e ">> Configurated this set of scripts.\n"
print_line
echo -e "Cancel at any time with CTRL+C.\n"
pause


### Main Menu ##################################################################

while true; do
  main
  print_info "This script has two parts: ${Yellow}Tests${BReset} and ${BYellow}Configs${BReset}. ${Yellow}Tests${BReset} runs tests that are not covered in ${BYellow}Configs${BReset}, such as ${Blue}NET${BReset} configuration checks. ${BYellow}Configs${BReset} runs a series of scripts that configure the environment according to lab instructions."
  echo " 1) $(mainmenu_item "${checklist[1]}" "Configs")"
  echo " 2) $(mainmenu_item "${checklist[2]}" "Tests")"
  echo -e "\n q) Quit\n"
  read_opts
  for OPT in ${OPTIONS[@]}; do
    case "$OPT" in
      1)
        configs
        checklist[1]=1
        ;;
      2)
        tests
        checklist[2]=1
        ;;
      "q")
        exit 0
        ;;
      *)
        invalid_option "$OPT"
        ;;
    esac
  done
done