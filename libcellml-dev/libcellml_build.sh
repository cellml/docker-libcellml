#!/bin/bash

REPOSITORY=$1
BRANCH=$2

BUILD_DIR=build-libcellml-release
SRC_DIR=libcellml

if [ -f "$REPOSITORY/CMakeLists.txt" ]; then
  echo "Using local repository."
  SRC_DIR=$REPOSITORY
elif [ "x$BRANCH" == "x" ]; then
  SRC_DIR=$(pwd)/libcellml
  git clone --single-branch $REPOSITORY $SRC_DIR
else
  SRC_DIR=$(pwd)/libcellml
  git clone -b $BRANCH --single-branch $REPOSITORY $SRC_DIR
fi

if [ "$?" == "0" ]; then
  mkdir $BUILD_DIR
  cd $BUILD_DIR
  if cmake $SRC_DIR; then
    make -j
    make test
    make coverage
    make memcheck
    if [ "$?" == "0" ]; then
      echo "The libCellML repository passed all tests."
    else
      echo "libCellML tests failed."
    fi
  else
    echo "Configuration of project using CMake failed."
  fi
else
  echo "Git clone of '$REPOSITORY' using branch '$BRANCH' has failed."
fi

