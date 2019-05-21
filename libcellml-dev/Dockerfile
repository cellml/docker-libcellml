FROM hsorby/libcellml-base:0.1.2

ADD VERSION .

WORKDIR /usr/code

COPY ./libcellml_build.sh /

ENTRYPOINT ["/libcellml_build.sh"]

CMD ["--help"]

