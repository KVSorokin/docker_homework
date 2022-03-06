FROM node:14-alpine
WORKDIR /app
COPY /frontend .
EXPOSE 3000
RUN npm install --silent
RUN npm run build && npm install -g serve
CMD ["serve", "-s", "build"]
