# taskcraft

Flutter mobile app (`app/`) + Go REST API (`api/`) in one monorepo. Progress log: `docs/DONE.md`.

## Commands (run from repo root)
- `make api-run`: start the API on :8080
- `make api-test`: run Go tests
- `make app-run`: run the Flutter app (Chrome by default; `make app-run DEVICE=<id>` for an emulator)
- `cd app && flutter analyze && flutter test`

## Go gotcha
The machine has `GO111MODULE=off` globally. Always prefix Go commands with `GO111MODULE=on` (the Makefile already does). Never run `go env -w`. Without it, Go ignores `go.mod` and `GET /health` style routes return 404.

## Go architecture (`api/`)
- `cmd/<binary>/main.go`: wiring only (config -> router -> server).
- `internal/config`: env-based config. `internal/server`: router + http.Server.
- `internal/<feature>/`: one package per feature (e.g. `health`). Add `handler.go`, then `service.go` / `repository.go` only when the feature needs them (handler -> service -> repository).
- Standard library first; add a dependency only with a reason.

## Flutter architecture (`app/`)
Feature-first Clean Architecture with Bloc, Dio for HTTP.
- `lib/core/`: shared config, network (Dio client), error types.
- `lib/features/<feature>/{domain,data,presentation}`.
- Dependency rule: presentation -> domain <- data. `domain` is pure Dart. Only `data` imports Dio.
- State: `flutter_bloc` (events -> states, Equatable). DI by constructor via `RepositoryProvider`/`BlocProvider`, no service locator.

## Android emulator
The host machine is `10.0.2.2` from inside an Android emulator (not `localhost`). Debug manifest allows cleartext http.

## Working agreements
- Show a plan and wait for approval before editing.
- Never commit or push unless asked.
- After each task, add an entry to `docs/DONE.md`.
- The owner knows Flutter, not Go: explain Go in Dart terms.
