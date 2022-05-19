# Network
resource "yandex_vpc_network" "default" {
  name = "net"
}

resource "yandex_vpc_subnet" "default" {
  name = "subnet"
  zone           = "ru-central1-b"
  network_id     = "e2lln6o9kfdn8g779kl5"
  v4_cidr_blocks = ["192.168.101.0/24"]
}
