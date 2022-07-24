# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1gvk0a2750nkt41jh26"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g0k1eq7s5942g41mdq"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd88d14a6790do254kj7"
}

variable "service_account_id" {
  default = "ajev8pdvndpdi8qbaauo"
}

variable "s3_secret_key" {
  default = ""
}
variable "s3_access_key" {
  default = ""
}