FROM redis:6.0.7-alpine
COPY ./glibc-2.31-r0.apk /lib/
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN apk add /lib/glibc-2.31-r0.apk
WORKDIR /root/cloudreve
ADD cloudreve ./cloudreve
ADD conf.ini ./conf.ini
ADD cloudreve.db ./cloudreve.db
ADD run.sh ./run.sh
ADD key.bin ./key.bin

RUN chmod +x ./cloudreve
RUN chmod +x ./run.sh

CMD ./run.sh
