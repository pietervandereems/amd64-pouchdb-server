FROM node:6-alpine

RUN apk update && apk add python make g++ 
RUN npm install -g leveldown pouchdb-server

ADD add-db-user.sh /usr/bin/add-db-user.sh
RUN chmod +x /usr/bin/add-db-user.sh

RUN mkdir /pouchdb

WORKDIR /pouchdb

EXPOSE 5984

CMD ["pouchdb-server", "-p", "5984", "-o", "0.0.0.0"]
