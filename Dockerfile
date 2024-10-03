FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*
  
RUN git clone https://github.com/Toxic1239/Queen-RiasV2  /root/Toxic1239
WORKDIR /root/Toxic1239/


COPY package.json .
RUN npm install && npm install -g qrcode-terminal pm2

COPY . .

EXPOSE 3000

CMD ["npm","start" ]
