FROM node:18-alpine

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]
# RUN npm run prepare:node-server
#
COPY ["src/nest-server/package.json", "src/nest-server/package-lock.json", "./src/nest-server/"]

RUN npm run prepare:nest-server
#

COPY ["src/client/package.json", "src/client/package-lock.json", "./src/client/"]

RUN npm run prepare:client

COPY . .

RUN npm run build:client

#
RUN npm run build:nest-server
#

# CMD ["npm", "run", "start:node"]
#
CMD ["npm", "run", "start:nest"]
#

EXPOSE 3000