#!/bin/sh

# ./make.sh [debug, release]

if [ $# -lt 1 ]; then
  echo "need a parameter [debug, release]"
  exit 0
fi

if [ $1 = "debug" ]; then
  OPTIMIZATION="-O0"
  STRIP=""
elif [ $1 = "release" ]; then 
  OPTIMIZATION="-O2"
  STRIP="-s"
else
  echo "unknown parameter: $1"
  exit 0
fi

clear

COMPILER='gcc'
PRG='app.exe'
C_FLAGS="-D UNICODE -D _UNICODE -std=c99 ${OPTIMIZATION} -Wall -Wextra -pedantic -Wno-unused-parameter -Wno-missing-field-initializers"

COMMAND="${COMPILER} ${C_FLAGS} -o ${PRG} src/main.c
          ${STRIP}
          -Wl,--subsystem,windows"

ESC=$(printf '\033')
S='[Compile]'
echo ${ESC}[36m${S}${ESC}[m ${COMMAND}

${COMMAND}
