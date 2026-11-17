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

## Task 3: Makefile task runner
- Root `Makefile` with `make api-run`, `make api-test`, `make app-run` (defaults to Chrome, override with `make app-run DEVICE=macos`)
- `GO111MODULE=on` is set inside the Makefile only, global Go setting untouched
- `api/cmd/server/main_test.go`: test for the `/health` handler
- Verify: `make api-test`, `make api-run` then `curl -i localhost:8080/health`, `make app-run`

## Task 4: Flutter health screen + architecture
- `CLAUDE.md`: project rules, commands, Go gotcha, architecture, working agreements
- Go refactor: `cmd/server/main.go` is wiring only; `internal/config`, `internal/server`, `internal/health` (handler + tests, router tests for 200/405/404)
- Flutter: feature-first Clean Architecture with Bloc + Dio (`core/`, `features/health/{domain,data,presentation}`), bloc tests with mocktail
- Screen shows "API: ok" (or "API: unreachable" + Retry); Android emulator uses `10.0.2.2`, debug manifest allows cleartext http
- Verify: `make api-test`, `cd app && flutter analyze && flutter test`, then `make api-run` and `make app-run DEVICE=<emulator-id>`
