FROM node:lts-stretch

RUN mkdir /mnt/source
WORKDIR /mnt/source
RUN git clone https://github.com/munrexio/yandex2mqtt.git
WORKDIR /mnt/source/yandex2mqtt
RUN npm install

RUN sed -i 's/.\/config/.\/config\/config/g' /mnt/source/yandex2mqtt/app.js
RUN openssl req -x509 -nodes -subj '/CN=localhost' -newkey rsa:4096 -keyout key.pem -out cert.pem -days 7300

CMD npm start