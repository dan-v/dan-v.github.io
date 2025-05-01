FROM node:20-slim

WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source files
COPY . .

# Build CSS using Tailwind CLI
RUN npx tailwindcss -i ./src/styles/main.css -o ./dist/style.css --minify 