# Дашборд задач

> Этот файл только **агрегирует** задачи через Dataview. Сами задачи живут в заметках модулей
> (`modules/<модуль>.md`), чтобы двое не дрались за один файл. Не добавляй задачи сюда напрямую.

## 🔴 Открытые задачи (по модулям)

```dataview
TASK
FROM "docs/vault/modules"
WHERE !completed
GROUP BY file.link
SORT file.link ASC
```

## ✅ Завершено за последние 14 дней

```dataview
TASK
FROM "docs/vault/modules"
WHERE completed AND completion >= date(today) - dur(14 days)
SORT completion DESC
```

## 🔼 Приоритетные (высокий приоритет, открытые)

```dataview
TASK
FROM "docs/vault/modules"
WHERE !completed AND priority = "high"
SORT file.link ASC
```

---
Формат задачи (в `modules/<модуль>.md`):
`- [ ] Текст #tandemika/<модуль> 🔼 ➕YYYY-MM-DD`
Завершение: `- [x] Текст ✅YYYY-MM-DD`
