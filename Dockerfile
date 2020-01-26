# SPECIFY BASE IMAGE
FROM node:alpine as builder
WORKDIR /usr/react-client

# Dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./

# Default command
CMD ["npm", "run", "build"]

FROM nginx
EXPOSE 80
COPY --from=builder . /usr/share/nginx/html
