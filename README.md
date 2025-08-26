# Python Project Template

Empty Python project template serving as a starting point for a microservice exposing and API using FastAPI.

## 🚀 Getting Started

The following steps help you to set things up and get started quickly.

0. Ensure you have [Poetry 1.8](https://python-poetry.org/docs/1.8/#installation) installed and a virtual environment (Python 3.10) is configured and activated:

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

3. Adjust general `pyproject.toml` configuration, e.g. project name, authors, URL,...

## 🛳️ Containerization

Build container image:

```bash
docker build -t my-python-project:0.0.1 .

# Using Linux (e.g. Colima with rosetta):
# docker build -t my-python-project:0.0.1 . --platform=linux/arm64
```

Start container and expose API on [localhost:8000](http://localhost:8000/):

```bash
docker run -it -p 8000:8000 --env-file .env my-python-project:0.0.1
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
├── example.env                # Example file for (local) environment variables
├── poetry.lock                # Poetry lock file
├── pyproject.toml             # Poetry/Project metadata and dependencies
└──  ...
```

## References

The following lists useful sources which where used to configure this project template. Of course, all this is opinionated and not perfect 🫠.

- [FastAPI - Bigger Applications](https://fastapi.tiangolo.com/tutorial/bigger-applications/)
- [Docker Docs - Building best-practices](https://docs.docker.com/build/building/best-practices/)
- ...

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
