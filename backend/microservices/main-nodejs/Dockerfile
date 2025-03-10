FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including devDependencies)
RUN npm install

# Copy source files
COPY tsconfig.json ./
COPY src ./src

# Build TypeScript
RUN npx tsc

EXPOSE 4000

# Start the application
CMD ["npm", "run", "dev"]
