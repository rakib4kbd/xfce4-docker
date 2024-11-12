FROM ubuntu:24.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y
RUN apt-get install xfce4 \
                    xfce4-goodies \
                    dbus-x11 \
                    supervisor \
                    tigervnc-standalone-server \
                    wget \
                    -y

RUN wget 'https://zoom.us/client/6.2.6.2503/zoom_amd64.deb' && \
    apt-get install ./zoom_amd64.deb -y

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh"]
