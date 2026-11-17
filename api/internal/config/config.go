package config

import "os"

// Config holds settings read from environment variables.
type Config struct {
	Port string
}

// Load reads configuration, falling back to defaults.
func Load() Config {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	return Config{Port: port}
}
