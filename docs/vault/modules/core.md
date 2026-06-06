# Модуль 1 — Каркас (core)

Тег: `#tandemika/core` · Статус: 🟡 в работе (стартует)

## Scope
Пользователи, роли (преподаватель/ученик), связь препод↔ученик, JWT-auth.
Фундамент проекта: layout, конфиг, подключения к Postgres/Redis, миграции, healthcheck.

## Глубина (не голый CRUD)
- JWT: access + refresh, ротация refresh-токенов, отзыв (blacklist в Redis).
- Связь препод↔ученик как явная сущность с состоянием (приглашение/подтверждение), а не просто FK.
- Аккуратная обработка паролей (argon2id/bcrypt), нормализация email, защита от user enumeration.

## Задачи
- [x] Выбрать и зафиксировать фундамент: layout, роутер, инструмент миграций, JWT (ADR-001…004) #tandemika/core 🔼 ➕2026-06-06 ✅2026-06-06
- [ ] Поднять каркас Go-проекта: go.mod, cmd/, internal/, config, graceful shutdown #tandemika/core 🔼 ➕2026-06-06
- [ ] docker-compose: Postgres + Redis + сервис; Makefile (run/test/migrate) #tandemika/core 🔼 ➕2026-06-06
- [ ] Первая миграция: users (id, email, password_hash, role, timestamps) #tandemika/core 🔼 ➕2026-06-06
- [ ] Регистрация + логин, выдача access/refresh JWT #tandemika/core ➕2026-06-06
- [ ] Refresh-флоу: ротация + отзыв токенов через Redis #tandemika/core ➕2026-06-06
- [ ] Связь препод↔ученик: приглашение → подтверждение #tandemika/core ➕2026-06-06
- [ ] Middleware auth + проверка ролей #tandemika/core ➕2026-06-06
- [ ] Тесты на auth-логику (не CRUD) + базовый OpenAPI #tandemika/core ➕2026-06-06

## Заметки
- См. [[02-Decisions]] по фундаменту.
