FROM ubuntu:18.04

ADD VERSION .

ENV DEBIAN_FRONTEND=noninteractive

# Have to update the cache to install any packages.
RUN apt-get -qq update

# Install some pre-requisites for obtaining clang-format-8
RUN apt-get -qq -y install wget software-properties-common
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository  "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main"

# Install the basic requirements for building libCellML
RUN apt-get -qq -y install cmake git libxml2-dev

# Install the requirements for building the Python bindings
RUN apt-get -qq -y install python3-dev swig

# Install the requirements for running all tests
RUN apt-get -qq -y install valgrind clang-format-8

# Install clang-tidy for extra code compilation warnings
# RUN apt-get -qq -y install clang-tidy <-- skipping this as it doubles the size of the image

# Install the requirements for building the documentation
RUN apt-get -qq -y install doxygen python3-sphinx

# llvm makes use of Python2??? so we don't need this
#RUN ln -s /usr/bin/python3 /usr/bin/python

