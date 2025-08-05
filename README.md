# Python Project template

Empty Python project template

## Repository Structure

...

## Alternative Approaches

### Ruff Instead of Black

...

Add the following to `pyproject.toml`:

```bash
[tool.poetry.group.dev.dependencies]
...
ruff = "^0.12.7"

[tool.ruff]
# Ruff linter configuration. See: https://docs.astral.sh/ruff/rules/
line-length = 120
target-version = "py310"
src = ["app"]
```
