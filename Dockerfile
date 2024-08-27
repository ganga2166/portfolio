FROM node:18-alpine

WORKDIR /app

COPY package*.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .

#environment variable to fix OpenSSL issue
ENV NODE_OPTIONS=--openssl-legacy-provider

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]