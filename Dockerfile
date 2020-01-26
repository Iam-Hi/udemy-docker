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
COPY --from=builder /usr/react-client/build /usr/share/nginx/html
