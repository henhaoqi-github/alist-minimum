FROM alpine:3.18 as builder
LABEL stage=go-builder
WORKDIR /app/
# 设置用户
RUN addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser
# 复制 zip 文件到容器中
COPY Dockerfile alist.zip ./
# 安装 unzip 命令
RUN apk add --no-cache unzip
# 解压 zip 文件
RUN unzip alist.zip -d ./
# 删除 zip 文件
RUN rm alist.zip
RUN apk add --no-cache bash curl gcc git go musl-dev; \
    bash build.sh release docker

FROM alpine:3.18
LABEL MAINTAINER="i@nn.ci"
VOLUME /opt/alist/data/
WORKDIR /opt/alist/
COPY --from=builder /app/bin/alist ./
COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache bash ca-certificates su-exec tzdata; \
    chmod +x /entrypoint.sh
ENV PUID=0 PGID=0 UMASK=022
EXPOSE 5244 5245
CMD [ "/entrypoint.sh" ]

USER 10001
