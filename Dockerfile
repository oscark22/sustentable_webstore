FROM node:21-alpine3.17

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

ENV PORT=80

RUN npm run build

RUN npm ci --omit dev

EXPOSE 80

CMD ["node", "-r", "dotenv/config", "build"]




