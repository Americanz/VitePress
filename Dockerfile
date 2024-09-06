FROM node:16-alpine

WORKDIR /app

# Копіюємо package.json та package-lock.json (якщо є)
COPY package*.json ./

# Встановлюємо залежності
RUN npm ci

# Копіюємо решту файлів проекту
COPY . .

# Попередньо будуємо проект
RUN npm run build

EXPOSE 8080

# Використовуємо скрипт для оновлення та запуску
CMD sh -c "npm run build && npm run serve"
