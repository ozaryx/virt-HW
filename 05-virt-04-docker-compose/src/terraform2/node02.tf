resource "yandex_compute_instance" "node02" {
  name                      = "node02"
  zone                      = "ru-central1-b"
  hostname                  = "node02.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.centos-7-base}"
      name        = "root-node02"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = "e2lln6o9kfdn8g779kl5"
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}
