# 🧠 База знаний

Заметки о том, что узнали по ходу проекта — чтобы потом **повторить**, а не гуглить заново.
Один файл = одна тема. Пиши своими словами, добавляй раздел «Проверь себя» для самоконтроля.

## Формат заметки
Frontmatter сверху (для Dataview) + тело:
```markdown
---
tags: [tandemika/kb]
topic: http        # широкая тема: http, postgres, redis, go, auth, concurrency...
module: core       # к какому модулю относится (или general)
added: YYYY-MM-DD
---
# Заголовок
...тело...
## Проверь себя
- вопрос → (свернуть/вспомнить ответ)
```

## Все заметки

```dataview
TABLE topic AS "Тема", module AS "Модуль", added AS "Добавлено"
FROM "docs/vault/knowledge"
WHERE file.name != "README"
SORT added DESC
```

## По темам

```dataview
TABLE rows.file.link AS "Заметки"
FROM "docs/vault/knowledge"
WHERE file.name != "README"
GROUP BY topic
SORT topic ASC
```
