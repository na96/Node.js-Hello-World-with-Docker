FROM arm32v7/node:8.9

RUN mkdir -p /opt/app

#Create app directory
WORKDIR /opt/app

RUN npm install

#Install app dependencies
#A wildcard is used to ensure both package.json and package-lock.json are
#copied where available
COPY package.json package-lock.json* ./

RUN npm i -g pm2

#Bundle app source
COPY . /opt/app

EXPOSE 8080

CMD [ "pm2", "start", "server.js", "--no-daemon" ]
