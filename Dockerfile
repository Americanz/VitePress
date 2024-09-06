FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

# Копіюємо весь вміст docs
COPY docs /app/docs

ENV PORT=8080

EXPOSE $PORT

CMD sh -c "npm run docs:build && npm run docs:preview -- --port $PORT"
