# Podman Compose — HTML Demo

Sample lightweight web application built with **Nginx Alpine** and orchestrated via **Podman Compose** / **Docker Compose**. Designed for container build testing, deployment pipelines, and platform verification.

---

## Project Structure

```
├── compose.yaml          # Modern compose specification
├── docker-compose.yml    # Docker / Podman compose configuration
├── Dockerfile            # Lightweight Nginx Alpine build definition
├── nginx.conf            # Custom Nginx configuration with /health probe
├── src/
│   └── index.html        # Interactive, responsive dashboard
└── README.md
```

---

## Quick Start

### 1. Run with Podman Compose

```bash
# Build and start in detached mode
podman compose up -d --build

# Inspect running container
podman compose ps

# Follow container logs
podman compose logs -f web

# Stop and remove container
podman compose down
```

### 2. Run with Docker Compose

```bash
docker compose up -d --build
```

### 3. Run directly with Podman CLI

```bash
# Build container image
podman build -t podman-compose-html-demo:latest .

# Run container on port 3000
podman run -d --name podman-compose-html-demo -p 3000:80 podman-compose-html-demo:latest

# Health check
curl -i http://localhost:3000/health
```

---

## Configuration

| Environment Variable | Default | Description |
|----------------------|---------|-------------|
| `PORT`               | `3000`  | Host port mapped to container port 80 |
| `APP_ENV`            | `production` | Application environment tag |

---

## Endpoints

- `GET /` — Responsive web dashboard with live uptime and telemetry.
- `GET /health` — HTTP 200 health check probe (`healthy`).
