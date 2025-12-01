job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    count = 1

    task "hello-app" {
      driver = "docker"

      config {
        image = "ranjanxth/springer-hello:latest"
      }

      resources {
        cpu    = 50
        memory = 32
      }
    }
  }
}
