# Response style for changes

When the user asks for a code, configuration, or environment change, prefer a concise, implementation-oriented response:

- Clearly distinguish between a **proposed** change and an **applied** change.
- When the user requests approval before editing, do not modify files. Show the exact proposed unified diff with the affected path, followed by short **Behavior** and **Notes** sections covering consequences, conflicts, and any manual follow-up.
- Once the user authorizes a change, implement it, preserve unrelated work, and validate or reload it when appropriate. Then summarize the affected files, resulting behavior, and any diagnostics.
- Surface relevant persisted state, runtime overrides, or restart requirements that could prevent the file change from taking effect.
- Do not add an approval step to routine changes the user has already explicitly authorized.
