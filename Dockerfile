# Use the official Node.js image as the base image
FROM node:20


WORKDIR /deploy/api/

COPY /deploy/api/package*.json ./
COPY /deploy/api/tsconfig.json ./

# Install the application dependencies
RUN npm install
    
# Copy the rest of the application files
COPY . .

# Build the NestJS application
RUN npm run build

# Expose the application port
EXPOSE 3000

# RUN ls / -alh
# RUN pwd
# RUN ls -alh
# RUN ls dist/src -alh

# Command to run the application
CMD ["node", "dist/src/main"]