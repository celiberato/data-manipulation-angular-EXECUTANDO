FROM node:latest as node-angular-cli
LABEL authors="Carlos"
 
# Building Angular app
WORKDIR /app
COPY package.json /app
RUN yarn install
COPY . /app
 
# Creating bundle
RUN npm run build --prod
 
WORKDIR /app/dist/data-manipulation-angular-executando
EXPOSE 80
ENV PORT 80
CMD [ "npm", "start" ]
