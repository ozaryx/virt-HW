
locals {

  zone = {
    stage = "ru-central1-a"
    prod  = "ru-central1-a"
  }

  instance_count = {
    stage = 1
    prod  = 2
  }

  cpu_count = {
    stage = 1
    prod  = 2
  }

  mem_size = {
    stage = 1
    prod  = 2
  }

  disk_size = {
    stage = 50
    prod  = 50
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

resource "yandex_compute_instance_group" "group01" {
  name                      = "${terraform.workspace}"
  folder_id                 = "${var.yandex_folder_id}"
  service_account_id        = "${var.servcie_account_id}"
  hostname                  = "node01.netology.cloud"
  allow_stopping_for_update = true

  instance_template {
    platform_id = "standard-v1"
    resources {
      cores  = "${local.mem_size["${terraform.workspace}"]}"
      memory = "${local.mem_size["${terraform.workspace}"]}"
    }

    boot_disk {
      initialize_params {
        image_id = var.centos-7-base
        name     = "root-node01"
        type     = "network-nvme"
        size     = "${local.disk_size["${terraform.workspace}"]}"
      }

    }
    network_interface {
      subnet_id = "${yandex_vpc_subnet.default.id}"
      nat       = true
    }

    metadata = {
      ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
    }
  }

  allocation_policy {
    zones = ["${local.zone["${terraform.workspace}"]}"]
  }
}

resource "yandex_storage_bucket" "terraform_state" {
  bucket = "tf-state-${terraform.workspace}"
}

# resource "yandex_storage_bucket" "test" {
#  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  bucket = "tf-test-bucket"
# }
