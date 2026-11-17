package server

import (
	"net/http"
	"time"

	"github.com/SantharamSathyamoorthy/taskcraft/api/internal/health"
)

// NewRouter registers all routes and returns the handler.
func NewRouter() http.Handler {
	mux := http.NewServeMux()
	mux.HandleFunc("GET /health", health.Handler)
	return mux
}

// New builds an http.Server listening on the given port.
func New(port string, handler http.Handler) *http.Server {
	return &http.Server{
		Addr:              ":" + port,
		Handler:           handler,
		ReadHeaderTimeout: 5 * time.Second,
	}
}
