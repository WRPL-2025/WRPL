FROM node:18-alpine

WORKDIR /app/frontend

# # Copy frontend files first
# COPY frontend/package*.json ./
# COPY frontend/vite.config.ts ./

# # Install dependencies
# RUN npm install

# Copy the rest of the frontend application
COPY frontend/ .

# Install dependencies
RUN npm install

# Expose the port
EXPOSE 3000

# Start the app
CMD ["npm", "run", "dev"]

