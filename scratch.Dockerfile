FROM scratch
LABEL MAINTAINER="kcoewoys"

EXPOSE 8888
WORKDIR /home/docker
COPY . .

CMD /home/docker/dogo
# 方法一
# 先交叉编译，然后只把二进制文件放到新镜像中
# set GOOS=linux
# set GOARCH=amd64
# go build

# 方法二
# 重新构建一个有基本功能的镜像
# https://www.cnblogs.com/sap-jerry/p/10029824.html



# docker run --rm -it -v /c/Users/Administrator/Documents/dogo:/go golang \
    # go env -w GOPROXY=https://goproxy.io,direct


#docker build -f scratch.Dockerfile -t dogo:scratch .
#docker run --rm -p 8888:8888 dogo:scratch