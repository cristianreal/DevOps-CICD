# etapa de compilación
FROM node:9.11.1-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install && npm install vue-router vue-google-charts && npm i vue-materialize-datatable --save && npm install @vue/cli-plugin-unit-jest @vue/test-utils && npm install -S vue-sweetalert2 && npm install vue-izitoast --save
COPY ./ .
RUN npm run build
RUN npm test

# etapa de producción
FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
