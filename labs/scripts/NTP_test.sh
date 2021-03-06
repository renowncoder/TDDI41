#!/bin/bash
source common.sh
# Where are we?
HOST="`uname -n`"
# If client, see if we have synced at some point (might take a while ...)
[[ ! $HOST == "gw" ]] && [[ `ntpq -p | grep 130.236 | cut -c 1 ` == "*" ]] && exit 0
# If NTP broadcaster, check if synced to higher stratum (..178.1) and if broadcast is set
[[ $HOST == "gw" ]] && [[ `ntpq -p | grep ida-gw | cut -c 1 ` == "*" ]] && [[ `ntpq -p | grep ${nw}.$((${STARTADDRESS}+7)) | cut -c 19-22 ` == "BCST" ]] && exit 0
exit 1
