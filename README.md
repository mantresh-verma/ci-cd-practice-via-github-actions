# GitHub Actions Mastery ??

This repository is a practical guide and template for setting up professional-grade CI/CD pipelines using GitHub Actions, Python, and Docker.

## ?? Features
- **Modern Python Setup**: Uses \uv\ for lightning-fast dependency management and virtual environments.
- **Unified CI/CD Pipeline**: A single workflow that handles testing, linting, and Docker publishing.
- **Production-Ready Docker**: Optimized \Dockerfile\ with multi-stage concepts, non-root users, and build caching.
- **Automated Testing**: Integrated \pytest\ and \lake8\ for high code quality.

## ?? Project Structure
- \.github/workflows/\: Contains the CI/CD pipeline logic.
- \math_ops.py\: Core logic for mathematical operations.
- \	ests/\: Automated test suite.
- \Dockerfile\: Containerization configuration.

## ?? Getting Started

### Prerequisites
- Python 3.10+
- [uv](https://github.com/astral-sh/uv) installed

### Local Development
1. **Install dependencies:**
   \\\ash
   uv sync
   \\\`n2. **Run tests:**
   \\\ash
   uv run pytest
   \\\`n3. **Run linting:**
   \\\ash
   uv run flake8 .
   \\\`n
## ?? CI/CD Pipeline
The project uses a unified pipeline defined in \.github/workflows/pipeline.yml\:
1. **Test Stage**: Runs tests and linting on Python 3.10, 3.11, and 3.12.
2. **Publish Stage**: (On \main\ push only) Builds a Docker image and pushes it to Docker Hub, but only if all tests pass.

## ?? Docker Hub Integration
To enable Docker publishing, you must add the following secrets to your GitHub repository:
- \DOCKERHUB_USERNAME\: Your Docker Hub username.
- \DOCKERHUB_TOKEN\: Your Docker Hub Access Token.
