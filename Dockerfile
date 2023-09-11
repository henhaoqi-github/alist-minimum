FROM xhofe/alist:v3.27.0

VOLUME /opt/alist/data/
WORKDIR /opt/alist/
COPY ./data ./data
COPY entrypoint1.sh /entrypoint1.sh
RUN apk add --no-cache bash ca-certificates su-exec tzdata; \
    chmod +x /entrypoint1.sh
ENTRYPOINT [ "/entrypoint1.sh" ]
