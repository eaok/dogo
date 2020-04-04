FROM golang:latest
LABEL MAINTAINER="kcoewoys"

ENV GOPROXY=https://goproxy.cn,direct

EXPOSE 8888
WORKDIR /home/docker

COPY . .

RUN make

CMD [ "bash", "-c", "/home/docker/dogo" ]

#docker build -f golang.Dockerfile -t dogo:golang .
#docker run --rm -p 8888:8888 dogo:golang