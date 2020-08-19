FROM node:12
COPY . /server
WORKDIR /server
EXPOSE 5000
RUN npm install --silent
CMD [ "npm", "run", "dev" ]