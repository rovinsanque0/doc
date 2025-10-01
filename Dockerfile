# Assignment 11: Dockerfile for Create React App (Development)

# Use a lightweight Node.js 18 image as the base
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /sanque_rovin_site

# Copy dependency files first and install packages
# (keeps builds faster by caching npm install if dependencies don’t change)
COPY package*.json ./
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Set environment variables so the app runs on port 7775
# HOST=0.0.0.0 allows external access (not just inside the container)
ENV HOST=0.0.0.0
ENV PORT=7775

# Document that the app uses port 7775 inside the container
EXPOSE 7775

# Default command to start the React development server
CMD ["npm", "start"]
