FROM node:18-alpine

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]

RUN npm run prepare:server

COPY ["src/client/package.json", "src/client/package-lock.json", "./src/client/"]

RUN npm run prepare:client

COPY . .

RUN npm run build:client

CMD ["npm", "run", "start"]

EXPOSE 3000