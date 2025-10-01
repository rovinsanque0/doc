# Assignment 11: Dockerfile for Create React App (Development)

This project shows how to run a React application inside a Docker container. The Dockerfile is based on the `node:18-alpine` image and is configured for development. A `.dockerignore` file is also included to keep builds efficient by excluding unnecessary files such as `node_modules`.

## Project Structure
Dockerfile  
.dockerignore  
package.json  
package-lock.json  
src/  
public/  

## Dockerfile Overview
- Base image: `node:18-alpine`
- Working directory: `/sanque_rovin_site`
- Copy `package.json` and `package-lock.json` first
- Run `npm install` to install dependencies
- Copy remaining application files into the container
- Set environment variables:
  - `HOST=0.0.0.0` → app listens on all interfaces
  - `PORT=7775` → React dev server runs on this port
- Expose port `7775`
- Default command: `npm start`

## .dockerignore
The `.dockerignore` file excludes the `node_modules` folder from being copied into the image. This prevents copying a large and potentially incompatible local `node_modules` directory. It ensures that dependencies are installed inside the container with the correct Node.js environment, reduces image size, and speeds up the build process.

## How to Build and Run
To build the Docker image, run:

docker build -t sanque_rovin_assignment11:dev .

## To run the container, use:
docker run -p 7775:7775 sanque_rovin_assignment11:dev


## Once the container is running, open a browser and go to:
http://localhost:7775
