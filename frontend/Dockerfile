FROM node:18-alpine

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Make sure we have a clean src directory
RUN rm -rf src || true

# Copy the application code
COPY . .

EXPOSE 3000

# Start the development server
CMD ["npm", "run", "dev"]

