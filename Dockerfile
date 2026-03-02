FROM node:lts-alpine
ADD . /srv/www
WORKDIR /srv/www
RUN npm install
RUN npm run build

CMD ["./bin/slackin.js", "--port",  "80" ]
EXPOSE 80
