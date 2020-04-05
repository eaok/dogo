# dogo
[![Build Status](https://travis-ci.com/kcoewoys/dogo.svg?branch=master)](https://travis-ci.com/kcoewoys/dogo)
[![codecov](https://codecov.io/gh/kcoewoys/dogo/branch/master/graph/badge.svg)](https://codecov.io/gh/kcoewoys/dogo)
[![GoDoc](https://godoc.org/github.com/kcoewoys/dogo?status.svg)](https://godoc.org/github.com/kcoewoys/dogo)
[![Go Report Card](https://goreportcard.com/badge/github.com/kcoewoys/dogo)](https://goreportcard.com/report/github.com/kcoewoys/dogo)

---
> docker test for [daocloud.io](https://account.daocloud.io)

构建镜像：
```bash
make docker
```

最终镜像大小如下：
![](http://blog.maser.top/docker/docker_size.png)

启动：
```bash
docker-compose up -d
```

测试：
```
localhost:28888/v1/api/hello
localhost:28889/v1/api/hello
localhost:28890/v1/api/hello
localhost:28891/v1/api/hello
localhost:28892/v1/api/hello
localhost:28893/v1/api/hello
```