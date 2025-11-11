# Docker Compose: Alloy, Loki, and Grafana for Docker Log Monitoring

This Docker Compose setup collects Docker logs using Alloy and sends them to Loki for storage and visualization in Grafana.

## Architecture

- **Alloy**: Collects Docker logs from the Docker daemon
- **Loki**: Stores and indexes logs
- **Grafana**: Visualizes logs through dashboards and queries

## Prerequisites

- Docker and Docker Compose installed
- At least 2GB of available disk space

## Setup and Usage

### 1. Start the Services

```bash
docker-compose up -d
```

This will start all three services:
- Loki on port 3100
- Alloy on port 12345
- Grafana on port 3000

### 2. Access Grafana

Open your browser and navigate to:
```
http://localhost:3000
```

**Default credentials:**
- Username: `admin`
- Password: `admin`

### 3. Query Docker Logs

In Grafana:
1. Go to **Explore** (left sidebar)
2. Select **Loki** as the data source
3. Use the query editor to filter logs

**Example queries:**
```
{job="docker"}
```

```
{container_name="loki"}
```

```
{image_name=~".*nginx.*"}
```

## Configuration Files

- **docker-compose.yml**: Main Docker Compose configuration
- **loki-config.yml**: Loki server configuration
- **alloy-config.yml**: Alloy log collection rules
- **grafana-datasources.yml**: Grafana data source setup
- **grafana-dashboards.yml**: Grafana dashboard provisioning

## Stopping Services

```bash
docker-compose down
```

To also remove persistent volumes:
```bash
docker-compose down -v
```

## Logs Location

Docker logs are stored in:
- Loki storage: `./loki-storage/`
- Grafana data: `./grafana-storage/`