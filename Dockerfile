FROM ubuntu:24.04
RUN apt-get update -y && \
    apt-get dist-upgrade -y
RUN apt-get install xfce4 \
                    xfce4-goodies \
                    dbus-x11 \
                    tigervnc-standalone-server \
                    wget \
                    -y

RUN apt-get install supervisor -y

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh"]
