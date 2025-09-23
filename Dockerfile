# Assignment 11: Dockerfile for Create React App (Development)
FROM node:18-alpine

WORKDIR /sanque_rovin_site


# Cache deps
COPY package*.json ./
RUN npm install

# App files
COPY . .

# ensures that the react app listen on all interfaces
ENV HOST=0.0.0.0
ENV PORT=7775

EXPOSE 7775

CMD [ "npm", "start" ]
