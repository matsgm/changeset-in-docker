# base image
FROM node:lts-alpine3.15

WORKDIR /app
COPY ./* ./
COPY ./.changeset ./.changeset

# Run Lerna Bootstrap
RUN npm ci

RUN apk update
RUN apk add git

CMD ["npm", "exec", "@changesets/cli"]