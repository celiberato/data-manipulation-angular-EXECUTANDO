FROM node:latest as node-angular-cli
LABEL authors="Carlos"
 
# Building Angular app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
 
# Creating bundle
RUN npm run build --prod
 
WORKDIR /app/dist/browser
EXPOSE 80
ENV PORT 80
RUN npm install http-server -g
CMD [ "http-server" ]
