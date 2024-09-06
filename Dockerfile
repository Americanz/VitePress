FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY docs/.vitepress /app/docs/.vitepress

RUN mkdir -p /app/docs

ENV PORT=8080

EXPOSE $PORT

CMD sh -c "npm run docs:build && npm run docs:preview -- --port $PORT"
