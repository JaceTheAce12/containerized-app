# Build stage
FROM node:18-slim AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if it exists)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app (outputs to /app/dist)
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy the built static files from the builder stage to Nginx's serve directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 (Nginx default)
EXPOSE 80

# Nginx runs automatically, no CMD needed