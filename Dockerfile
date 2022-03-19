FROM nginx:1.21.1-alpine

ENV \
    HTPASSWD='' \
    FORWARD_PORT=80 \
    FORWARD_HOST=web \
    NGINX_PORT=80 \
    NGINX_HOST=localhost \
    PROXY_MAX_TEMP_FILE_SIZE=0

WORKDIR /opt

RUN \
    apk add --no-cache gettext && \
    sed -i -e 's/^root::/root:!:/' /etc/shadow

COPY auth.conf auth.htpasswd launch.sh ./

CMD ["./launch.sh"]
