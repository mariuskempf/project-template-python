# ---------- Stage 1: Build ----------
FROM python:3.10.14-slim AS builder

# Set environment variables for Poetry and Python
ENV POETRY_VERSION=1.8.4 \
    POETRY_VIRTUALENVS_CREATE=true \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Install Poetry
RUN pip install --no-cache-dir poetry==$POETRY_VERSION

WORKDIR /app

# Copy dependency files only
COPY pyproject.toml poetry.lock ./

# Install only the main dependencies (not dev)
RUN poetry install --no-root --only main


# ---------- Stage 2: Runtime ----------
FROM python:3.10.14-slim AS runtime

WORKDIR /

# Make the virtualenv binaries accessible in PATH
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="/app/.venv/bin:$PATH"

# Add non-root user
RUN useradd --create-home appuser

# Copy virtual environment from builder stage
COPY --from=builder /app/.venv /app/.venv

# Copy application code
COPY ./app ./app

# use non-root user
USER appuser

EXPOSE 8000

# Start FastAPI app with uvicorn using the venv
CMD ["uvicorn", "app.api:app", "--host", "0.0.0.0", "--port", "8000"]
