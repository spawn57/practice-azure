FROM node:18-alpine

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json and package-lock.json are copied where available (npm@5+)
COPY --chown=node:node package*.json ./

# Install app dependencies
RUN npm ci 

# if you are buidling your code for production
# RUN npm ci --only-production

# Bundle app source
COPY . .

ENV NODE_ENV production
USER node

# Creates a "dist" folder with production build
RUN npm run build


EXPOSE 8080

CMD [ "node", "dist/main.js"]