#Base image
FROM node:16-alpine
RUN apk update && apk add --no-cache libc6-compat
RUN corepack enable && corepack prepare pnpm@7.4.1 --activate 

#Install some deps
WORKDIR /usr/app
COPY ./package.json /usr/app
RUN pnpm install
COPY ./ ./

#Start up command
CMD ["pnpm", "run", "start"]
