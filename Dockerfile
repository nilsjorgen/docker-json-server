FROM node:18-alpine

LABEL maintainer="nils.jorgen.mittet@nav.no"

RUN npm install -g json-server

VOLUME /data

WORKDIR /data

ENV DATA_FILE="db.json"

EXPOSE 3000

CMD json-server -H 0.0.0.0 -w $DATA_FILE
