FROM node:lts-alpine3.12
WORKDIR '/app'
COPY ./package.json /app
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html