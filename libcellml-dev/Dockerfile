FROM hsorby/libcellml-base:latest

ADD VERSION .

WORKDIR /usr/code

COPY ./libcellml_build.sh /

ENTRYPOINT ["/libcellml_build.sh"]

CMD []

