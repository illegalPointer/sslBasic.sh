#!/bin.bash
# SSL Basic Tests
# Usage: sh sslBasic.sh testname IP/DNS Port

YELLOW='\033[0;33m'
GRAY='\033[0;37m'
GREEN='\033[1;32m'
RED='\033[1;31m'

TESTSSL=""
SSLENUM=""

HOME="$(echo ~)"

ARGS=3

if [ "$#" != "${ARGS}" ]; then
      echo "${RED}Illegal number of parameters!${GRAY}"
        echo "${GREEN}Usage: sh $0 testname IP/DNS Port${GRAY}"
    else
          screen -d -m -S "testSSL_$1" bash ${TESTSSL} --logfile "${HOME}/${1}_${2}_${3}_testssl.log" ${2}":"${3}
            screen -d -m -S "sslEnum_$1" perl ${SSLENUM} --outfile "${HOME}/${1}_${2}_${3}_sslenum.txt" ${2}":"${3}
              echo "${YELLOW}Ended. Session list:${GRAY}"
                screen -ls
            fi
