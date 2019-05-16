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
  if cmake -DPREFERRED_CLANG_FORMAT_NAMES=clang-format-8 $SRC_DIR; then
    if make -j; then
      if make test; then
        if make coverage; then
          if make memcheck; then
            if make test_clang_format; then
              echo "The libCellML repository passed all tests."
            else
              echo "libCellML clang-format test failed."
            fi
          else
            echo "libCellML memory check test failed."
          fi
        else
          echo "libCellML code coverage test failed."
        fi
      else
        echo "libCellML failed to pass all unit tests."
      fi
    else
      echo "libCellML failed to compile."
    fi
  else
    echo "Configuration of project using CMake failed."
  fi
else
  echo "Git clone of '$REPOSITORY' using branch '$BRANCH' has failed."
fi

