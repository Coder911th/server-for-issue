FROM node:10-alpine

# Install acme.sh
RUN apk add --no-cache curl
RUN apk add --no-cache openssl
RUN curl https://get.acme.sh | sh

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80
CMD [ "npm", "start" ]