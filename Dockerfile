FROM node:18-alpine

COPY ./web/.output .

CMD [ "node", "server/index.mjs" ]

EXPOSE 80
EXPOSE 443