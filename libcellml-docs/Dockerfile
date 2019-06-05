FROM hsorby/libcellml-base:0.1.4

ADD VERSION .

# Install the requirements for building the documentation
RUN apt-get -qq update && apt-get -qq -y install \
# Install required packages
    doxygen=1.8.13-10 \
    python3-sphinx=1.6.7-1ubuntu1 \
    python3-pip=9.0.1-2.3~ubuntu1 \
    graphviz=2.40.1-2 \
# Clean downloaded apt packages after intsll
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install screen for running simple http server in the background
#RUN apt-get -qq -y install screen
RUN pip3 install sphinx-autobuild

# Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /users/code

COPY ./libcellml_docs.sh /

ENTRYPOINT ["/libcellml_docs.sh"]
 
CMD ["--help"]

