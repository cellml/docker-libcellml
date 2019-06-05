#!/bin/bash

HELP=0
POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -h|--help)
    HELP=1
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
  echo "    docker run hsorby/libcellml-docs REPO_URL [BRANCH]"
  exit 0
fi

REPOSITORY=$1
BRANCH=$2

BUILD_DIR=$(pwd)/build-libcellml-release
SRC_DIR=libcellml

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

RUNSERVER=0
if [ "$?" == "0" ]; then
  mkdir $BUILD_DIR
  cd $BUILD_DIR
  if cmake -DPREFERRED_CLANG_FORMAT_NAMES=clang-format-8 $SRC_DIR; then
    if make -j docs; then
      RUNSERVER=1
      echo "The libCellML documentation has been successfully created."
    else
      echo "libCellML failed to create the documentation."
    fi
  else
    echo "Configuration of project using CMake failed."
  fi
else
  echo "Git clone of '$REPOSITORY' using branch '$BRANCH' has failed."
fi

if [ "$RUNSERVER" == "0" ]; then
  exit 1
else
  # Run the server.
  echo "Run the server."
fi

exec sphinx-autobuild --host 0.0.0.0 --port 8000 --ignore *.swp --ignore *.rst~ --ignore *.rst.swx -q -b html -c $BUILD_DIR/docs/_build -d $BUILD_DIR/docs/_doctrees $SRC_DIR/docs $BUILD_DIR/docs/html

