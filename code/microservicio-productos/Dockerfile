FROM node:12

COPY package*.json /server/
WORKDIR /server
RUN npm install --silent
EXPOSE 5000

COPY ./ .

CMD [ "npm", "run", "dev" ]