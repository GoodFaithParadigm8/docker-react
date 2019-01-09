# Base image
FROM node:alpine as builder

# Application directory
WORKDIR '/app'

# Ready dependency install
COPY package.json .
 
# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build project
RUN npm run build

# Prep server build
FROM ngix

# Copy build folder
COPY --from=builder /app/build /usr/share/nginx/html



