# Python Project Template

Empty Python project template.

## Repository Structure

...

## References

The following lists useful sources which where used to configure this project template. Of course, all this is opinionated and not perfect 🫠.

- [FastAPI - Bigger Applications](https://fastapi.tiangolo.com/tutorial/bigger-applications/)

## Considerations

### Ruff Instead of Black

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
