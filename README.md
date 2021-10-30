SWE550-as1
# An Items list Web Application 
A web application in one container developed using HTML and connected with a MongoDB container.
# Motivation
In this project a Docker Compose environment developed to configure and run multiple Docker containers in local environment. 
# Prerequisites
Download and install Docker Desktop, Visual Studio Code, and node.js.
# Installation
1. install "npm" 
NPM is a node package manage, it is used for managing dependencies of various server side dependencies. 
```bash 
npm init  
```
2. Install body-parse:  parsing the incoming request bodies. 
```bash 
npm install body-parse
```
3. Install ejs:  EJS is a templating engine 
```bash 
npm install ejs 
```
4. Install express: web application framework for Node. js
```bash 
npm install express -save
```
5. Install mongoose: a Node. js based Object Data Modeling (ODM) library for MongoDB. 
```bash
npm install mongodb -save
```

```bash 
# package.json
{
  "name": "webapp",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "body-parser": "^1.19.0",
    "ejs": "^3.1.6",
    "express": "^4.17.1",
    "mongoose": "^6.0.12"
  }
}
```
# Code 
Using three-step process: firstly, Define app's environment with a Dockerfile.Then, Define the services that make up web app in docker-compose.yml so they can be run together in an isolated environment.
Lastly, run docker compose up and Compose will start and run the entire app.

1. Docker File:
```bash 
# Dockerfile 
FROM node:10

WORKDIR /Users/wejdan/Desktop

COPY package*.json ./ 

RUN npm install 

COPY . .

EXPOSE 3000

CMD ["npm", "node index.js"]
```
2. Docker compose file:
```bash 
# docker-compose.yml
version: '3'
services:
  app:
    container_name: docker-node-mongo
    restart: always
    build: .
    ports:
      - '80:3000'
    links: 
     - mongo
  mongo:
    container_name: mongo
    image: mongo
    ports:
      - '27017:27017'
   ```
   3. Run in docker
   a web application container and mongodb container 
```bash  
docker-compose up
```

   4. Stop and remove containers, networks.

```bash 
docker-compose down
   ```
# Screenshoots
1. Run containers process "docker-compose up".
<img src= "Container Created process.jpeg">


2. Containers list "docker container ls"
<img src= "Container ls screenshoot.png">


3. Containers screenshoot
<img src= "Containers Screenshoot">


