terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

    backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "ys3"
    region     = "ru-central1"
    key        = "tfstate.tfstate"
#    access_key = "<идентификатор статического ключа>"
#    secret_key = "<секретный ключ>"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id                 = "${var.yandex_cloud_id}"
  folder_id                = "${var.yandex_folder_id}"
  zone                     = "ru-central1-a"
}
