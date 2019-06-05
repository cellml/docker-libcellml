FROM ubuntu:18.04

ADD VERSION .

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qq update && apt-get -qq -y install \
# Install the basic requirements for building libCellML
    cmake=3.10.2-1ubuntu2 \
    git=1:2.17.1-1ubuntu0.4 \
    libxml2-dev=2.9.4+dfsg1-6.1ubuntu1.2 \
# Install the requirements for building the Python bindings
    python3-dev=3.6.7-1~18.04 \
    swig=3.0.12-1 \
# Clean downloaded apt packages after intsll
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

