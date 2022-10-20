FROM golang:latest

LABEL maintainer="alipeng@aliyun.com"

# install cgo-related dependencies
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends software-properties-common tzdata;\
    add-apt-repository -y ppa:strukturag/libde265; \
    add-apt-repository -y ppa:strukturag/libheif; \
    add-apt-repository -y ppa:tonimelisma/ppa; \
    apt-get install -y --no-install-recommends libvips-dev;\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    apt-get autoremove -y software-properties-common; \
    apt-get purge -y software-properties-common; \
    rm -rf /var/lib/apt/lists/*