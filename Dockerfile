# Stage 1: Builder
FROM python:3.11-slim AS builder

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .

# Security Patch: Base image ke purane packages ko upgrade karna
# Isse wheel aur pip ki vulnerabilities theek ho jayengi
RUN pip install --upgrade pip setuptools wheel jaraco.context

# Install dependencies into a specific folder
RUN uv sync --frozen --no-dev

# Stage 2: Final Image
FROM python:3.11-slim

WORKDIR /app

# Builder se patched environment copy karna
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/math_ops.py /app/

ENV PATH="/app/.venv/bin:$PATH"

# Security: Non-root user
RUN useradd -m appuser
USER appuser

CMD ["python", "math_ops.py"]
