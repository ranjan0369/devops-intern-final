# Docker Compose: Alloy, Loki, and Grafana for Docker Log Collection

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
{container_name="mysql"}
```

```
{image_name=~".*nginx.*"}
```

### 4. Monitor Logs

In the Explore view:
- View real-time Docker logs
- Filter by container name, image, or service
- Search for error patterns
- Set up alerts based on log content

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

## Troubleshooting

### Alloy cannot connect to Docker socket
Ensure the docker socket is properly mounted and has correct permissions:
```bash
ls -la /var/run/docker.sock
```

### No logs appearing in Grafana
1. Check Alloy logs: `docker logs alloy`
2. Check Loki logs: `docker logs loki`
3. Verify the datasource connection in Grafana

### Container logs not being collected
Check that containers are running and Alloy has access to them:
```bash
docker ps
docker logs alloy
```

## Advanced Configuration

### Enable Structured Logs
Edit `loki-config.yml` and set:
```yaml
allow_structured_logs: true
```

### Increase Log Retention
Modify `loki-config.yml`:
```yaml
table_manager:
  retention_deletes_enabled: true
  retention_period: 30d
```

### Add More Log Filters in Alloy
Edit `alloy-config.yml` to add more relabel rules or processing stages.
