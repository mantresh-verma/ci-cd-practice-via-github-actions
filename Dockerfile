# Industry Standard: Use a slim image for smaller size
FROM python:3.11-slim

# Install uv
COPY --from=astral-sh/setup-uv:latest /uv /uvx /bin/

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies using uv
# --frozen ensures we use the exact versions from uv.lock
RUN uv sync --frozen

# Industry Practice: Don't run as root for security
RUN useradd -m appuser
USER appuser

# This is just a placeholder command since we have a library, not a web app yet
CMD ["uv", "run", "python", "math_ops.py"]
