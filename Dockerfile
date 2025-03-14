#FROM        node
#WORKDIR     /home/node
#COPY        node_modules/ node_modules/
#COPY        package.json server.js ./
#USER node 
#ENTRYPOINT  ["node", "server.js"]


FROM node:18  

WORKDIR /home/node

# Copy only package files first to leverage Docker cache
COPY package.json server.js ./

# Temporarily run as root to install packages
RUN npm install --omit=dev
COPY node_modules/ node_modules/

# Copy the rest of the app files
COPY . .

# Now drop to a safer user
USER node  

CMD ["node", "server.js"]
