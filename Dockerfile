# Stage 1: Build the application
FROM node:18-alpine AS build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package*.json ./

# Update npm to the latest version
RUN npm install -g npm@latest

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Stage 2: Create the runtime image
FROM node:18-alpine

WORKDIR /usr/src/app

# Copy built files from the build stage
COPY --from=build /usr/src/app .

# Expose the port that the Next.js app will run on
EXPOSE 3000

# Health check to monitor the application's status
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:3000 || exit 1

# Start the Next.js app
CMD ["npm", "start"]
