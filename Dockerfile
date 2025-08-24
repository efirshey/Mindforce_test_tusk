# встановлення залежностей
FROM node:22-alpine AS deps
WORKDIR /app
COPY . .

# збирання
FROM node:22-alpine AS build
WORKDIR /app
COPY . .

# надлегкий рантайм
FROM gcr.io/distroless/nodejs22-debian12
WORKDIR /app
COPY . .
