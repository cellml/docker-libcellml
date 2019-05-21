FROM ubuntu:18.04

ADD VERSION .

ENV DEBIAN_FRONTEND=noninteractive

# Install some pre-requisites for obtaining clang-format-8
RUN apt-get -qq update && apt-get -qq -y install \
    software-properties-common=0.96.24.32.8 \
    wget=1.19.4-1ubuntu2.2
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository  "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main"

# Install the basic requirements for building libCellML
RUN apt-get -qq update && apt-get -qq -y install \
    cmake=3.10.2-1ubuntu2 \
    git=1:2.17.1-1ubuntu0.4 \
    libxml2-dev=2.9.4+dfsg1-6.1ubuntu1.2

# Install the requirements for building the Python bindings
RUN apt-get -qq update && apt-get -qq -y install \
    python3-dev=3.6.7-1~18.04 \
    swig=3.0.12-1

# Install the requirements for running all tests, unfortunately it seems we cannot pin the version of
# clang-format as it is still getting updated.
RUN apt-get -qq update && apt-get -qq -y install \
    valgrind=1:3.13.0-2ubuntu2.1 \
    clang-format-8

# Install clang-tidy for extra code compilation warnings
# RUN apt-get -qq -y install clang-tidy <-- skipping this as it doubles the size of the image

# llvm makes use of Python2??? so we don't need this
#RUN ln -s /usr/bin/python3 /usr/bin/python

