# Stage 1: Builder
FROM python:3.11-slim AS builder

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Install dependencies into a specific folder
RUN uv sync --frozen --no-dev

# Stage 2: Final Image
FROM python:3.11-slim

WORKDIR /app

# Sirf zaroori files aur virtual environment copy karna
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/math_ops.py /app/

# Environment path set karna taaki .venv use ho
ENV PATH="/app/.venv/bin:$PATH"

# Security: Non-root user
RUN useradd -m appuser
USER appuser

CMD ["python", "math_ops.py"]
