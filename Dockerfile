FROM node:20-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npx @tailwindcss/cli -i ./src/styles/main.css -o ./dist/style.css --minify 