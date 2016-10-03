FROM ruby:2.3-alpine

ENV HIERA_EYAML_VERSION=2.1.0

RUN gem install --version "${HIERA_EYAML_VERSION}" hiera-eyaml \
    && gem install aws-sdk hiera-eyaml-kms \
    && rm -rf /usr/local/lib/ruby/gems/*/cache/* \
    && adduser -D eyaml && mkdir /eyaml

USER eyaml
WORKDIR /eyaml
VOLUME ["/eyaml"]

ENTRYPOINT ["eyaml"]
CMD ["--help"]
