FROM ubuntu:18.04

ADD VERSION .

WORKDIR /usr/code

RUN apt-get -qq update
RUN apt-get -qq -y install cmake git libxml2-dev python3-dev swig valgrind
RUN ln -s /usr/bin/python3 /usr/bin/python

