# Stage 1: Builder
FROM python:3.11-slim AS builder

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Builder stage security patch
RUN pip install --no-cache-dir --upgrade pip setuptools wheel jaraco.context
RUN uv sync --frozen --no-dev

# Stage 2: Final
FROM python:3.11-slim

WORKDIR /app

# Final stage security patch
RUN pip install --no-cache-dir --upgrade pip setuptools wheel jaraco.context

# Copy artifacts from builder
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/math_ops.py /app/

# Environment path setup
ENV PATH="/app/.venv/bin:$PATH"

# Security: Create and use non-root user (using adduser for better compatibility)
RUN adduser --disabled-password --gecos '' appuser
USER appuser

CMD ["python", "math_ops.py"]
