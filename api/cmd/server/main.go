package main

import (
	"log"

	"github.com/SantharamSathyamoorthy/taskcraft/api/internal/config"
	"github.com/SantharamSathyamoorthy/taskcraft/api/internal/server"
)

func main() {
	cfg := config.Load()
	srv := server.New(cfg.Port, server.NewRouter())

	log.Println("listening on :" + cfg.Port)
	log.Fatal(srv.ListenAndServe())
}
