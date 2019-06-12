FROM libcellml/base:1.0.0

ADD VERSION .

RUN apt-get -qq update && apt-get -qq -y install \
# Install pre-requisites for clang-format-8
    software-properties-common=0.96.24.32.9 \
    wget=1.19.4-1ubuntu2.2 \
# Install the requirements for running memory checks
    valgrind=1:3.13.0-2ubuntu2.1 \
# Clean downloaded apt packages after intsll
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get llvm version 8
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository  "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main"

# Install the requirements for running clang based tests, unfortunately it seems we cannot pin the version of
# clang-format as it is still getting updated.
RUN apt-get -qq update && apt-get -qq -y install \
    clang-format-8 clang-tidy-8 \
# Clean downloaded apt packages after intsll
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install clang-tidy for extra code compilation warnings
# RUN apt-get -qq -y install clang-tidy <-- skipping this as it doubles the size of the image

# llvm makes use of Python2??? so we don't need this
#RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /users/code

COPY ./libcellml_build.sh /

ENTRYPOINT ["/libcellml_build.sh"]

CMD ["--help"]

