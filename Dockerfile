# Stage 1: Build
FROM node:10-alpine AS build
WORKDIR /app
COPY package*.json ./
# Install dependency
RUN npm install
# Copy source code
COPY . .
# Stage 2: Runtime
FROM node:10-alpine
WORKDIR /app
RUN npm install -g pm2
COPY --from=build /app /app
EXPOSE 3000
CMD ["pm2-runtime", "npm", "--", "start"]
