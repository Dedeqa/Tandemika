# Лог проекта (append-only)

> **Правила (нас двое):** каждый ДОБАВЛЯЕТ свой датированный блок **снизу**. Существующие блоки
> НИКОГДА не редактируются. Всегда указывай автора: `## YYYY-MM-DD — @nick`.

<!-- Новые записи дописывай НИЖЕ этой строки -->

## 2026-06-06 — @fedos
- **Сделано:** инициализация vault — структура `docs/vault/` (00-Overview, 01-Tasks с Dataview, 02-Decisions, 03-Log, modules/{core,schedule,materials,tests,chat}, snippets/). Зафиксирован фундамент проекта.
- **Решения:** [[02-Decisions#ADR-001: Структура проекта — feature-based internal|ADR-001]] (layout feature-based internal), [[02-Decisions#ADR-002: HTTP-роутер — chi|ADR-002]] (chi), [[02-Decisions#ADR-003: Инструмент миграций — golang-migrate с timestamp-неймингом|ADR-003]] (golang-migrate + timestamp-нейминг), [[02-Decisions#ADR-004: JWT-стратегия — access + refresh с ротацией и отзывом через Redis|ADR-004]] (access+refresh, ротация, отзыв через Redis). Vault открывается из корня репо → Dataview-пути `docs/vault/modules`.
- **Ветка/PR:** docs/vault-init
- **Следующий шаг:** поднять каркас Go-проекта (go.mod, cmd/ + internal/, config, graceful shutdown), docker-compose (Postgres+Redis), Makefile, первая миграция `create_users` — Модуль 1 (Каркас).
- **Открытые вопросы:** установить в vault community-плагины Obsidian Tasks + Dataview (иначе дашборд/чекбоксы не работают), закоммитить `.obsidian/community-plugins.json` + `.obsidian/plugins/`.
