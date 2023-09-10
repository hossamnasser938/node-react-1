FROM node:18-alpine

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]

RUN npm run prepare:node-server

COPY ["src/client/package.json", "src/client/package-lock.json", "./src/client/"]

RUN npm run prepare:client

COPY . .

RUN npm run build:client

CMD ["npm", "run", "start:node"]

EXPOSE 3000