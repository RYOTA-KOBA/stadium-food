FROM ruby:2.5.7-alpine3.11

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

ENV BUILD_PACKAGES="build-base" \
    DB_PACKAGES="sqlite-dev postgresql-dev" \
    RAILS_PACKAGES="tzdata nodejs imagemagick" \
    FAVORITE_PACKAGES="less"

RUN apk update && \
    apk upgrade && \
    apk add git && \
    apk --update --no-cache add \
            ${BUILD_PACKAGES} \
            ${DB_PACKAGES} \
            ${RAILS_PACKAGES} \
            ${FAVORITE_PACKAGES} 
            
WORKDIR /app

COPY Gemfile \
     Gemfile.lock \
     /app/

RUN gem install bundler && bundle install 

# 下記のコードは、頻繁に Gemfile を変更する場合、コメントアウトを推奨します。
# RUN apk del ${BUILD_PACKAGES}

# https://github.com/bundler/bundler/issues/6154
ENV BUNDLE_GEMFILE='/app/Gemfile'