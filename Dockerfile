FROM node:21-alpine3.17

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

RUN npm ci --omit dev

EXPOSE 3000

CMD ["node", "build"]





