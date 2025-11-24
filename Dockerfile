FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json if you use it
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy source code
COPY . .

# Expose app port
EXPOSE 3000

# Healthcheck (optional but good)
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

# Start app
CMD ["npm", "start"]
