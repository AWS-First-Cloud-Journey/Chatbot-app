# Use the official Node.js image for building
FROM node:16-alpine AS build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Use a lightweight Node.js image for the runtime
FROM node:16-alpine

WORKDIR /usr/src/app

# Copy built files from the build stage
COPY --from=build /usr/src/app .

# Expose the port that the Next.js app will run on
EXPOSE 3000

# Set environment variable for OpenAI API key
ENV OPENAI_API_KEY=xxxxxxxxx

# Health check to monitor the application's status
HEALTHCHECK --interval=30s --timeout=5s CMD wget -q http://localhost:3000 || exit 1

# Start the Next.js app
CMD ["npm", "start"]
