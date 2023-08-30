# Use the official Node.js image for building and running
FROM node:18-alpine AS build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package*.json ./

# Install only production dependencies and cache them
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Use a lightweight Node.js image for the runtime
FROM node:18-alpine

WORKDIR /usr/src/app

# Copy only the built files and production dependencies from the build stage
COPY --from=build /usr/src/app/package.json /usr/src/app/package-lock.json ./
COPY --from=build /usr/src/app/.next ./.next
COPY --from=build /usr/src/app/public ./public

# Expose the port that the Next.js app will run on
EXPOSE 3000

# Health check to monitor the application's status
HEALTHCHECK --interval=30s --timeout=5s CMD wget -q --spider http://localhost:3000 || exit 1

# Start the Next.js app
CMD ["npm", "start"]
