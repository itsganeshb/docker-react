FROM node:alpine as builder

WORKDIR /use/app/frontend

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /use/app/frontend/build /usr/share/nginx/html

