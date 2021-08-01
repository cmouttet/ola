FROM node:lts-stretch

RUN npm install --global @angular/cli grunt-cli http-server

EXPOSE 8080
