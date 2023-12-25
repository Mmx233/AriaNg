FROM httpd:alpine

RUN apk update && \
    apk upgrade --no-cache && \
    rm -rf /var/cache/apk/*

COPY dist /usr/local/apache2/htdocs
