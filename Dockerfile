#FROM        node
#WORKDIR     /home/node
#COPY        node_modules/ node_modules/
#COPY        package.json server.js ./
#USER node 
#ENTRYPOINT  ["node", "server.js"]

FROM node:18

# Set working directory
WORKDIR /home/node

# Copy package files first for better cache use
COPY package.json server.js ./

# Ensure this part runs as root (temporary)
USER root

# Install dependencies with root permissions
RUN npm install --omit=dev

# Copy the rest of your app’s code
COPY . .

# Now switch to a non-root user (safer)
USER node

# Define the default command
CMD ["node", "server.js"]



