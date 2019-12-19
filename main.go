package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	g := gin.Default()
	g.GET("/v1/api/hello", func(context *gin.Context) {
		context.JSON(http.StatusOK, gin.H{
			"Message": "hello world",
		})
	})
	g.Run(":9999")
}
