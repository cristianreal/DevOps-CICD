# etapa de compilación
FROM node:9.11.1-alpine as build-stage
WORKDIR /app
COPY ./ .
#RUN npm install --silent && npm install vue-router --silent && npm run build
RUN npm install && npm install vue-router && npm run build
# etapa de producción
FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80