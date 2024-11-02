FROM node:18-bullseye AS builder

RUN npm install -g bower grunt-cli
RUN apt-get -qq update && apt-get install -qqy libavahi-compat-libdnssd-dev python-is-python3

WORKDIR /dashkiosk
COPY . /dashkiosk/
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install
RUN grunt
RUN cd dist && \
    npm install --production

RUN chmod +x /dashkiosk/entrypoint.sh

# We use SQLite by default. If you want to keep the database between
# runs, don't forget to provide a volume for /database.
VOLUME /database

ENV NODE_ENV production
ENV port 8888
ENV db__options__storage /database/dashkiosk.sqlite

# ENTRYPOINT [ "/dashkiosk/entrypoint.sh" ]
EXPOSE 8888
