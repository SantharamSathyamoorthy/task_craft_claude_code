# GO111MODULE=on is set per command here, so the global Go setting is untouched.
DEVICE ?= chrome

.PHONY: api-run api-test app-run

api-run:
	cd api && GO111MODULE=on go run ./cmd/server

api-test:
	cd api && GO111MODULE=on go test ./...

app-run:
	cd app && flutter run -d $(DEVICE)
