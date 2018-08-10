#!/bin/bash

rm -Rf build/*
mkdir build/
VERSION="${1}";

export GOARCH=amd64
export GOOS=darwin
go build -o build/tsjson-${GOOS}-${VERSION} . 

export GOOS=linux
go build -o build/tsjson-${GOOS}-${VERSION} . 

export GOOS=windows
go build -o build/tsjson-${GOOS}-${VERSION}.exe . 
