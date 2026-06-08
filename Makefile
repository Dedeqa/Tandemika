SHELL := /bin/sh

MIGRATIONS_DIR := migrations

ifneq (,$(wildcard .env))
	include .env
	export
endif

.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make compose-up       Start infrastructure containers"
	@echo "  make compose-down     Stop infrastructure containers"
	@echo "  make compose-ps       Show containers status"
	@echo "  make migrate-up       Apply database migrations"
	@echo "  make migrate-down     Roll back one database migration"
	@echo "  make migrate-version  Show current database migration version"
	@echo "  make fmt              Format Go code"
	@echo "  make vet              Run go vet"
	@echo "  make test             Run tests"
	@echo "  make build            Build all Go packages"
	@echo "  make ci               Run local CI checks"

.PHONY: compose-up
compose-up:
	docker compose up -d

.PHONY: compose-down
compose-down:
	docker compose down

.PHONY: compose-ps
compose-ps:
	docker compose ps

.PHONY: migrate-up
migrate-up:
	migrate -path $(MIGRATIONS_DIR) -database "$(POSTGRES_DSN)" up

.PHONY: migrate-down
migrate-down:
	migrate -path $(MIGRATIONS_DIR) -database "$(POSTGRES_DSN)" down 1

.PHONY: migrate-version
migrate-version:
	migrate -path $(MIGRATIONS_DIR) -database "$(POSTGRES_DSN)" version

.PHONY: fmt
fmt:
	gofmt -w .

.PHONY: vet
vet:
	go vet ./...

.PHONY: test
test:
	go test ./...

.PHONY: build
build:
	go build ./...

.PHONY: ci
ci:
	@test -z "$$(gofmt -l .)"
	go vet ./...
	go test ./...
	go build ./...