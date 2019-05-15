#!/bin/bash

REPOSITORY=$1
BRANCH=$2
BUILD_DIR=build-libcellml-release
SRC_DIR=libcellml

git clone -b $BRANCH --single-branch $REPOSITORY $SRC_DIR
mkdir $BUILD_DIR
cd $BUILD_DIR
cmake ../$SRC_DIR
make -j
make test
make coverage
make memcheck

