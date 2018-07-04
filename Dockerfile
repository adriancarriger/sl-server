FROM node:8-alpine
WORKDIR /app

RUN apk --no-cache add \
  curl \
  && curl -sf https://up.apex.sh/install | sh

COPY package.json .

RUN yarn

COPY . .

CMD [ "yarn", "start" ]
