# Npm run build
FROM node:16-alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# Nginx setup (copy contents of '/app/build' from previous service)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html