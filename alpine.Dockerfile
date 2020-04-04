FROM golang:alpine
LABEL MAINTAINER="kcoewoys"

ENV GOPROXY=https://goproxy.cn,direct

EXPOSE 8888
WORKDIR /home/docker

COPY . .

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && \
    # apk update && \
    apk add git make
    # apk add --no-cache --virtual mypacks git
    
# RUN apk add tzdata && \
#     ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
#     echo Asia/Shanghai > /etc/timezone

RUN make
# RUN make && apk del mypacks

CMD ["/home/docker/dogo"]

#docker build -f alpine.Dockerfile -t dogo:alpine .
#docker run --rm -p 8888:8888 dogo:alpine