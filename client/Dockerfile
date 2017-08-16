FROM emud/nginx-nodejs:6

WORKDIR /app
COPY package.json /app/
RUN npm config set registry http://registry.npmjs.org/ && npm install

COPY nginx.conf /etc/nginx/sites-available/default
COPY . /app/

RUN npm run build

VOLUME /app/node_modules
