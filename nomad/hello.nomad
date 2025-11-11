job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    count = 1

    task "hello" {
      driver = "docker"

      config {
        image = "nginx:latest"
      }

      resources {
        cpu    = 50
        memory = 32
      }
    }
  }
}
