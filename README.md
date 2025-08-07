# Python Project Template

Empty Python project template.

## Getting Started

The following steps help you to set things up and get started quickly.

0. Ensure you have [Poetry 1.8](https://python-poetry.org/docs/1.8/#installation) installed and a python environment configured and activated:

   ```bash
   source .venv/bin/activate
   ```

1. Install dependencies using Poetry:

   ```bash
   poetry install --with dev
   ```

2. Activate pre-commit hooks:

   ```bash
   pre-commit install
   ```

## Repository Structure

The following briefly explains the structure of the project template.

```text
project-template-python/
│
├── app/                       # Main application code
│   ├── routers/               # API route definitions
│   ├── api.py                 # Main API router
│   ├── config.py              # Application configuration
│   ├── dependencies.py        # Dependency injection utilities
│   └── utils.py               # Utility functions
├── data/                      # Data for experimentation
├── docs/                      # Documentation files
├── notebooks/                 # Jupyter notebooks for experimentation
├── tests/                     # Unit and integration tests
│
├── .pre-commit-config.yaml    # Pre-commit hook configuration
├── .pylintrc                  # Pylint configuration
├── .todo                      # Personal to-do notes
├── example.env                # Example file for (local) environment variables
├── poetry.lock                # Poetry lock file
├── pyproject.toml             # Poetry/Project metadata and dependencies
└──  ...
```

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
