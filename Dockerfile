FROM        node
WORKDIR     /home/node
COPY        node_modules/ node_modules/
COPY        package.json server.js ./
USER node 
ENTRYPOINT  ["node", "server.js"]
