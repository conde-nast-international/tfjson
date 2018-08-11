#!/bin/bash

OS="${1}";
PROJECT_FOLDER=`cd $(dirname "${0}")/../ && pwd`;
BUILD_FOLDER="${PROJECT_FOLDER}/build";
GIT_HASH="$( git log -n 1 | head -n 1 | grep -o '[[:xdigit:]]\{7,\}' )";

if [ ! -d ${BUILD_FOLDER} ]; then mkdir ${BUILD_FOLDER}; fi;

ls ${BUILD_FOLDER}/tfjson-${OS}-* 1>/dev/null 2>&1;
EXISTING_BUILDS=${?};
if [ ${EXISTING_BUILDS} -eq 0 ]; then
  rm -f ${BUILD_FOLDER}/tfjson-${OS}-*;
fi;

EXT="";
if [ "${OS}" == "windows" ]; then
  EXT=".exe";
fi;

export GOOS=${OS};

export GOARCH=386
go build -o build/tfjson-${GOOS}-${GOARCH}-${GIT_HASH}${EXT} .
export GOARCH=amd64
go build -o build/tfjson-${GOOS}-${GOARCH}-${GIT_HASH}${EXT} .
