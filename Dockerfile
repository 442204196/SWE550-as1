FROM node:10

WORKDIR /Users/wejdan/Desktop

COPY package*.json ./ 

RUN npm install 

COPY . .

EXPOSE 3000

CMD ["npm", "node index.js"]