FROM node:12-slim

COPY package.json /app/package.json

WORKDIR /app
RUN npm install
RUN npm install -g @angular/cli@8.1.2

ENV PATH /app/node_modules/.bin:$PATH

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y curl
