FROM node:current-alpine3.15

RUN apk update --no-cache ; \
 apk add jq \
  curl \
  git \
  openjdk8-jre \
  make \
  bash \
  sed \
 ;

RUN npm install -g @openapitools/openapi-generator-cli
