FROM node:alpine as builder

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

WORKDIR /build

FROM httpd:alpine

RUN apk update && \
    apk upgrade --no-cache && \
    rm -rf /var/cache/apk/*

COPY --from=builder /build/dist /usr/local/apache2/htdocs/
