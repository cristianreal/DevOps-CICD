FROM node:12
COPY . /server
WORKDIR /server
EXPOSE 5000
RUN npm install && npm test
CMD [ "npm", "run", "dev" ]