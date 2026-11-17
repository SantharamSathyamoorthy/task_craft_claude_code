# Done

## Task 1: Monorepo skeleton
- `api/`: Go module `github.com/SantharamSathyamoorthy/taskcraft/api` with `cmd/` and `internal/`
- `app/`: Flutter project `taskcraft_app`
- `docs/`, root `README.md` and `.gitignore` (Go + Flutter/Dart)
- Verify: `cd api && GO111MODULE=on go build ./...` and `cd app && flutter analyze`

## Task 2: Hello Go API
- `api/cmd/server/main.go`: standard-library HTTP server on `:8080`
- `GET /health` returns `{"status":"ok"}` (200, `application/json`). Other methods get 405, unknown paths 404.
- Verify: `cd api && GO111MODULE=on go run ./cmd/server`, then `curl -i localhost:8080/health`
