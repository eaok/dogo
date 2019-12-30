package main

import (
    "os"
	"testing"
)

func TestMain(m *testing.M) {
    exitCode := m.Run()
    os.Exit(exitCode)
}

func TestShow(t *testing.T) {
    show()
}
