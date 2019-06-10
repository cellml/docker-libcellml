#!/bin/bash

HELP=0
POSITIONAL=()
SERIAL_BUILD=FALSE
BUILD_ONLY=FALSE
DEBUG=FALSE

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -h|--help)
    HELP=1
    shift # past argument
    ;;
    -s|--serial)
    SERIAL_BUILD=TRUE
    shift # past argument
    ;;
    -b|--build-only)
    BUILD_ONLY=TRUE
    shift # past argument
    ;;
    -d|--debug)
    DEBUG=TRUE
    shift # past argument
    ;;
#    -s|--searchpath)
#    SEARCHPATH="$2"
#    shift # past argument
#    shift # past value
#    ;;
    *)  # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
  esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ "$HELP" == "1" ]; then
  echo "Usage -- "
  echo "    docker run hsorby/libcellml-dev REPO_URL [BRANCH]"
  exit 0
fi

REPOSITORY=$1
BRANCH=$2

BUILD_DIR=build-libcellml-release
SRC_DIR=libcellml

BUILD_ARGS=()
if [ "x$SERIAL_BUILD" == "xFALSE" ]; then
  BUILD_ARGS+=("-j")
fi

if [ -f "$REPOSITORY/CMakeLists.txt" ]; then
  echo "Using local repository."
  SRC_DIR=$REPOSITORY
elif [ "x$REPOSITORY" == "x/bin/bash" ]; then
  exec /bin/bash
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
  if cmake -DPREFERRED_CLANG_FORMAT_NAMES=clang-format-8 -DPREFERRED_CLANG_TIDY_NAMES=clang-tidy-8 $SRC_DIR; then
    if make ${BUILD_ARGS[@]}; then
      if [ "x$BUILD_ONLY" == "xTRUE" ]; then
        echo "Finished building libraries and tests."
      else
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

if [ "x$DEBUG" == "xTRUE" ]; then
  exec /bin/bash
fi

