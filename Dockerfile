# Use the official Node.js image as base
FROM node:16-alpine

# Set the working directory within the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port that the Next.js app will run on
EXPOSE 3000

# Set environment variable for OpenAI API key
ENV OPENAI_API_KEY=xxxxxxxxx

# Build the Next.js app
RUN npm run build

# Start the Next.js app
CMD ["npm", "start"]
