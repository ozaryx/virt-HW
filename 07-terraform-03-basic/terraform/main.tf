
locals {

  instance_count = {
    stage = 1
    prod  = 2
  }

  instance_type = {
    stage = "t3.micro"
    prod  = "t3.small"
  }

  for_each_inst_count = {
    stage = { count = 1 }
    prod  = { count = 2 }
  }
}

# Create yandex_compute_instance

resource "yandex_compute_instance" "node01" {
  name                      = "node01"
  zone                      = "ru-central1-a"
  hostname                  = "node01.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.centos-7-base
      name     = "root-node01"
      type     = "network-nvme"
      size     = "50"
    }

  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_storage_bucket" "terraform_state" {
  bucket = "tf-state-${terraform.workspace}"
}

#resource "yandex_storage_bucket" "test" {
#  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  bucket = "tf-test-bucket"
#}
