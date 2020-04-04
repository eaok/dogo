FROM scratch
LABEL MAINTAINER="kcoewoys"

EXPOSE 8888
WORKDIR /home/docker
COPY dogo .

CMD ["/home/docker/dogo"]
# 方法一
# 先交叉编译，然后只把二进制文件放到新镜像中

# 方法二
# 重新构建一个有基本功能的镜像
# https://www.cnblogs.com/sap-jerry/p/10029824.html

# 方法三
# 在多重构建中使用

#docker build -f scratch.Dockerfile -t dogo:scratch .
#docker run --rm -p 8888:8888 dogo:scratch