### Multi Stage Build ###

### Estágio 1 - Obter o source e gerar o build ###
FROM node:18.10 AS ng-builder
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app

RUN npm update
RUN npm install -g npm@9.8.1
RUN npm install -g @angular/cli
RUN npm link @angular/cli

COPY . /app
RUN npm run build #--configuration production

### Estágio 2 - Subir o source para o servidor NGINX com a app Angular ###
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=ng-builder /app/dist /usr/share/nginx/html

EXPOSE 80
