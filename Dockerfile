FROM node:16-alpine

WORKDIR /app

# Встановлюємо залежності для збірки, якщо вони потрібні
RUN apk add --no-cache python3 make g++

COPY package*.json ./

RUN npm ci --only=production

COPY . .

RUN npm run build

EXPOSE 8080

CMD ["npm", "run", "serve"]
