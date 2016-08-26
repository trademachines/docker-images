FROM ruby:2.3-alpine
MAINTAINER aho@trademachines.com

RUN gem install riemann-elasticsearch

ENTRYPOINT ["sh", "-c"]

# if you want variable substition you need to place your cmd like CMD ["riemann-elasticsearch --host=${HOST} --port=${PORT}"]
CMD ["riemann-elasticsearch"]
