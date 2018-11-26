FROM node:10

WORKDIR /app

# Copy utility scripts
COPY ./development/scripts/* /usr/local/bin/

# Copy all packages
COPY ./ ./

RUN npm i -g lerna
RUN lerna bootstrap --ci -- --loglevel notice --unsafe-perm
# Build origin-js for event-listener
RUN npm run build --prefix origin-js