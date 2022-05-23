terraform kmankov$ terraform apply | tee ../../terraform-apply.md 2>&1

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.inventory will be created
  + resource "local_file" "inventory" {
      + content              = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "../ansible/inventory"
      + id                   = (known after apply)
    }

  # null_resource.cluster will be created
  + resource "null_resource" "cluster" {
      + id = (known after apply)
    }

  # null_resource.monitoring will be created
  + resource "null_resource" "monitoring" {
      + id = (known after apply)
    }

  # null_resource.sync will be created
  + resource "null_resource" "sync" {
      + id = (known after apply)
    }

  # null_resource.wait will be created
  + resource "null_resource" "wait" {
      + id = (known after apply)
    }

  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node01.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node01"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.11"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.node02 will be created
  + resource "yandex_compute_instance" "node02" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node02.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node02"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node02"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.12"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.node03 will be created
  + resource "yandex_compute_instance" "node03" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node03.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node03"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node03"
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.13"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.node04 will be created
  + resource "yandex_compute_instance" "node04" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node04.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node04"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node04"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.14"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.node05 will be created
  + resource "yandex_compute_instance" "node05" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node05.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node05"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node05"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.15"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_compute_instance.node06 will be created
  + resource "yandex_compute_instance" "node06" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + hostname                  = "node06.netology.yc"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCd5NLXs0dE/M+q8j9kpAWLmo718GDOt0MI7btZGHrK7aP0UJqBYVfolAlwpm+s8PmIarM5xblfYQ3Sj+e6dkADJ2NOxwCJg9FF3wllz/jvysS5AbcL09GsX8sCED+l0+DM6OxWFjUWpB9h+QOr1+FaaTL+6wOl42qi+uVGSiFnBarvl0lkdRZRKCb064mXPT0/qgvBnbpO13qrdF4A7Xvl2hiR78R0H0VVQew+scnkaA4uaAuUTMEkqghtE4eprQEkJ7UEvWEgpJzXK0dMZQjbDXfrCGIzUmtwuhCUq9eJfHOrq77diaedLitQIhv71fZEGppQUnzYsxaMUwQN6K4R8krYwFkkBOCoGpehQ6De+NGt0QxCHa00zUqD4vIFloKqCyKKA5QOjoUGiOyelYR8mZ/Fjiz42xeMHj9N4IaLS1l7YioYzHSQi79Vr3LvuFPrGCWrw/KKOSwJFf/KjA6v9CjKXDw08pKbccaH2qZjbxGGHK6R1aa8Tu9MTrJVyBE= kmankov@macbook0P0LYWK.local
            EOT
        }
      + name                      = "node06"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8mh0m4jhkuujfmv304"
              + name        = "root-node06"
              + size        = 40
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }

      + network_interface {
          + index              = (known after apply)
          + ip_address         = "192.168.101.16"
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = (known after apply)
        }

      + placement_policy {
          + host_affinity_rules = (known after apply)
          + placement_group_id  = (known after apply)
        }

      + resources {
          + core_fraction = 100
          + cores         = 4
          + memory        = 8
        }

      + scheduling_policy {
          + preemptible = (known after apply)
        }
    }

  # yandex_vpc_network.default will be created
  + resource "yandex_vpc_network" "default" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "net"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_subnet.default will be created
  + resource "yandex_vpc_subnet" "default" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "192.168.101.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + external_ip_address_node01 = (known after apply)
  + external_ip_address_node02 = (known after apply)
  + external_ip_address_node03 = (known after apply)
  + external_ip_address_node04 = (known after apply)
  + external_ip_address_node05 = (known after apply)
  + external_ip_address_node06 = (known after apply)
  + internal_ip_address_node01 = "192.168.101.11"
  + internal_ip_address_node02 = "192.168.101.12"
  + internal_ip_address_node03 = "192.168.101.13"
  + internal_ip_address_node04 = "192.168.101.14"
  + internal_ip_address_node05 = "192.168.101.15"
  + internal_ip_address_node06 = "192.168.101.16"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_network.default: Creating...
yandex_vpc_network.default: Creation complete after 2s [id=enpco3b9557lg898c3g0]
yandex_vpc_subnet.default: Creating...
yandex_vpc_subnet.default: Creation complete after 1s [id=e9bqn93rjst1akjekb8g]
yandex_compute_instance.node06: Creating...
yandex_compute_instance.node05: Creating...
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node04: Creating...
yandex_compute_instance.node03: Creating...
yandex_compute_instance.node02: Creating...
yandex_compute_instance.node05: Still creating... [10s elapsed]
yandex_compute_instance.node06: Still creating... [10s elapsed]
yandex_compute_instance.node04: Still creating... [10s elapsed]
yandex_compute_instance.node03: Still creating... [10s elapsed]
yandex_compute_instance.node02: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node05: Still creating... [20s elapsed]
yandex_compute_instance.node06: Still creating... [20s elapsed]
yandex_compute_instance.node04: Still creating... [20s elapsed]
yandex_compute_instance.node03: Still creating... [20s elapsed]
yandex_compute_instance.node02: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node05: Still creating... [30s elapsed]
yandex_compute_instance.node06: Still creating... [30s elapsed]
yandex_compute_instance.node03: Still creating... [30s elapsed]
yandex_compute_instance.node04: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node02: Still creating... [30s elapsed]
yandex_compute_instance.node06: Still creating... [40s elapsed]
yandex_compute_instance.node05: Still creating... [40s elapsed]
yandex_compute_instance.node04: Still creating... [40s elapsed]
yandex_compute_instance.node03: Still creating... [40s elapsed]
yandex_compute_instance.node02: Still creating... [40s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node03: Creation complete after 44s [id=fhmgg9l53u7vgsej46hi]
yandex_compute_instance.node04: Creation complete after 45s [id=fhmtq4usvgu3loienq20]
yandex_compute_instance.node02: Creation complete after 45s [id=fhm70vske3gs8avidfjo]
yandex_compute_instance.node01: Creation complete after 46s [id=fhm82mlnrgf4f2b6dhki]
yandex_compute_instance.node05: Creation complete after 46s [id=fhmrrbm6hp4kma18nevn]
yandex_compute_instance.node06: Creation complete after 48s [id=fhmkg9gqh6bio3v4gl1b]
local_file.inventory: Creating...
local_file.inventory: Creation complete after 0s [id=ceb0ddb32870ddc88074fae2272c8a9a012e967f]
null_resource.wait: Creating...
null_resource.wait: Provisioning with 'local-exec'...
null_resource.wait (local-exec): Executing: ["/bin/sh" "-c" "sleep 100"]
null_resource.wait: Still creating... [10s elapsed]
null_resource.wait: Still creating... [20s elapsed]
null_resource.wait: Still creating... [30s elapsed]
null_resource.wait: Still creating... [40s elapsed]
null_resource.wait: Still creating... [50s elapsed]
null_resource.wait: Still creating... [1m0s elapsed]
null_resource.wait: Still creating... [1m10s elapsed]
null_resource.wait: Still creating... [1m20s elapsed]
null_resource.wait: Still creating... [1m30s elapsed]
null_resource.wait: Still creating... [1m40s elapsed]
null_resource.wait: Creation complete after 1m40s [id=3316260517772399522]
null_resource.cluster: Creating...
null_resource.cluster: Provisioning with 'local-exec'...
null_resource.cluster (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-cluster.yml"]
null_resource.cluster (local-exec): /usr/local/Cellar/ansible/5.7.1/libexec/lib/python3.10/site-packages/paramiko/transport.py:236: CryptographyDeprecationWarning: Blowfish has been deprecated
null_resource.cluster (local-exec):   "class": algorithms.Blowfish,

null_resource.cluster (local-exec): PLAY [Install of Requrements Tools] ********************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node02.netology.yc]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]
null_resource.cluster: Still creating... [10s elapsed]
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster (local-exec): ok: [node01.netology.yc]
null_resource.cluster (local-exec): ok: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [install-tools : Installing tools] ****************************************
null_resource.cluster: Still creating... [20s elapsed]
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=python)
null_resource.cluster: Still creating... [30s elapsed]
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=python)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=wget)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=tcpdump)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=curl)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=wget)
null_resource.cluster: Still creating... [40s elapsed]
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=curl)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=curl)
null_resource.cluster: Still creating... [50s elapsed]
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=git)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=git)
null_resource.cluster: Still creating... [1m0s elapsed]
null_resource.cluster: Still creating... [1m10s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=ntp)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=python)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=tcpdump)
null_resource.cluster: Still creating... [1m20s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=wget)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=openssl)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=curl)
null_resource.cluster: Still creating... [1m30s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=git)

null_resource.cluster (local-exec): TASK [configure-hosts-file : Configure Hosts File] *****************************
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node04.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node04.netology.yc)
null_resource.cluster: Still creating... [1m40s elapsed]
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=node03.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node04.netology.yc)
null_resource.cluster: Still creating... [1m50s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node05.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node06.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node01.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node02.netology.yc)
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=node03.netology.yc)

null_resource.cluster (local-exec): PLAY [Install Docker Engine] ***************************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster: Still creating... [2m0s elapsed]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node01.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]
null_resource.cluster (local-exec): ok: [node02.netology.yc]
null_resource.cluster (local-exec): ok: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [docker-installation : Add docker repository] *****************************
null_resource.cluster (local-exec): changed: [node05.netology.yc]
null_resource.cluster (local-exec): changed: [node02.netology.yc]
null_resource.cluster (local-exec): changed: [node01.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node03.netology.yc]

null_resource.cluster (local-exec): TASK [docker-installation : Installing docker package] *************************
null_resource.cluster: Still creating... [2m10s elapsed]
null_resource.cluster: Still creating... [2m20s elapsed]
null_resource.cluster: Still creating... [2m30s elapsed]
null_resource.cluster: Still creating... [2m40s elapsed]
null_resource.cluster (local-exec): changed: [node05.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node02.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node05.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): ok: [node02.netology.yc] => (item=containerd.io)
null_resource.cluster: Still creating... [2m50s elapsed]
null_resource.cluster (local-exec): changed: [node04.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): changed: [node06.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node04.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): changed: [node01.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node06.netology.yc] => (item=containerd.io)
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=docker-ce-cli)
null_resource.cluster: Still creating... [3m0s elapsed]
null_resource.cluster (local-exec): ok: [node01.netology.yc] => (item=containerd.io)
null_resource.cluster: Still creating... [3m10s elapsed]
null_resource.cluster: Still creating... [3m20s elapsed]
null_resource.cluster: Still creating... [3m30s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc] => (item=docker-ce)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=docker-ce-cli)
null_resource.cluster (local-exec): ok: [node03.netology.yc] => (item=containerd.io)

null_resource.cluster (local-exec): TASK [docker-installation : Enable docker daemon] ******************************
null_resource.cluster: Still creating... [3m40s elapsed]
null_resource.cluster (local-exec): changed: [node05.netology.yc]
null_resource.cluster (local-exec): changed: [node02.netology.yc]
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node01.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]
null_resource.cluster: Still creating... [3m50s elapsed]
null_resource.cluster: Still creating... [4m0s elapsed]
null_resource.cluster: Still creating... [4m10s elapsed]
null_resource.cluster (local-exec): changed: [node03.netology.yc]

null_resource.cluster (local-exec): PLAY [Initialize Docker Swarm Cluster] *****************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Initialize Docker Swarm] *****************************
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Get the Manager join-token] **************************
null_resource.cluster: Still creating... [4m20s elapsed]
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-init : Get the worker join-token] ***************************
null_resource.cluster (local-exec): changed: [node01.netology.yc]

null_resource.cluster (local-exec): PLAY [Add Managers Swarm Cluster] **********************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster (local-exec): ok: [node03.netology.yc]
null_resource.cluster (local-exec): ok: [node02.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-add-manager : Add Managers to the Swarm] ********************
null_resource.cluster (local-exec): changed: [node02.netology.yc]
null_resource.cluster (local-exec): changed: [node03.netology.yc]

null_resource.cluster (local-exec): PLAY [Add Workers to the Swarm Cluster] ****************************************

null_resource.cluster (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.cluster: Still creating... [4m30s elapsed]
null_resource.cluster (local-exec): ok: [node05.netology.yc]
null_resource.cluster (local-exec): ok: [node06.netology.yc]
null_resource.cluster (local-exec): ok: [node04.netology.yc]

null_resource.cluster (local-exec): TASK [docker-swarm-add-worker : Add Workers to the Swarm] **********************
null_resource.cluster (local-exec): changed: [node04.netology.yc]
null_resource.cluster (local-exec): changed: [node06.netology.yc]
null_resource.cluster (local-exec): changed: [node05.netology.yc]

null_resource.cluster (local-exec): PLAY RECAP *********************************************************************
null_resource.cluster (local-exec): node01.netology.yc         : ok=11   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node02.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node03.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node04.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node05.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.cluster (local-exec): node06.netology.yc         : ok=9    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

null_resource.cluster: Creation complete after 4m34s [id=1089063302259537479]
null_resource.sync: Creating...
null_resource.sync: Provisioning with 'local-exec'...
null_resource.sync (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-sync.yml"]
null_resource.sync (local-exec): /usr/local/Cellar/ansible/5.7.1/libexec/lib/python3.10/site-packages/paramiko/transport.py:236: CryptographyDeprecationWarning: Blowfish has been deprecated
null_resource.sync (local-exec):   "class": algorithms.Blowfish,

null_resource.sync (local-exec): PLAY [nodes] *******************************************************************

null_resource.sync (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.sync: Still creating... [10s elapsed]
null_resource.sync (local-exec): ok: [node05.netology.yc]
null_resource.sync (local-exec): ok: [node02.netology.yc]
null_resource.sync (local-exec): ok: [node04.netology.yc]
null_resource.sync (local-exec): ok: [node06.netology.yc]
null_resource.sync (local-exec): ok: [node01.netology.yc]
null_resource.sync (local-exec): ok: [node03.netology.yc]

null_resource.sync (local-exec): TASK [Synchronization] *********************************************************
null_resource.sync: Still creating... [20s elapsed]
null_resource.sync: Still creating... [30s elapsed]
null_resource.sync: Still creating... [40s elapsed]
null_resource.sync: Still creating... [50s elapsed]
null_resource.sync: Still creating... [1m0s elapsed]
null_resource.sync: Still creating... [1m10s elapsed]
null_resource.sync: Still creating... [1m20s elapsed]
null_resource.sync (local-exec): changed: [node02.netology.yc]
null_resource.sync (local-exec): changed: [node05.netology.yc]
null_resource.sync (local-exec): changed: [node04.netology.yc]
null_resource.sync (local-exec): changed: [node01.netology.yc]
null_resource.sync: Still creating... [1m30s elapsed]
null_resource.sync (local-exec): changed: [node06.netology.yc]
null_resource.sync: Still creating... [1m40s elapsed]
null_resource.sync: Still creating... [1m50s elapsed]
null_resource.sync: Still creating... [2m0s elapsed]
null_resource.sync: Still creating... [2m10s elapsed]
null_resource.sync: Still creating... [2m20s elapsed]
null_resource.sync: Still creating... [2m30s elapsed]
null_resource.sync: Still creating... [2m40s elapsed]
null_resource.sync (local-exec): changed: [node03.netology.yc]

null_resource.sync (local-exec): PLAY RECAP *********************************************************************
null_resource.sync (local-exec): node01.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node02.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node03.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node04.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node05.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.sync (local-exec): node06.netology.yc         : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

null_resource.sync: Creation complete after 2m46s [id=4570590570871315597]
null_resource.monitoring: Creating...
null_resource.monitoring: Provisioning with 'local-exec'...
null_resource.monitoring (local-exec): Executing: ["/bin/sh" "-c" "ANSIBLE_FORCE_COLOR=1 ansible-playbook -i ../ansible/inventory ../ansible/swarm-deploy-stack.yml --limit=managers"]
null_resource.monitoring (local-exec): /usr/local/Cellar/ansible/5.7.1/libexec/lib/python3.10/site-packages/paramiko/transport.py:236: CryptographyDeprecationWarning: Blowfish has been deprecated
null_resource.monitoring (local-exec):   "class": algorithms.Blowfish,

null_resource.monitoring (local-exec): PLAY [nodes] *******************************************************************

null_resource.monitoring (local-exec): TASK [Gathering Facts] *********************************************************
null_resource.monitoring (local-exec): ok: [node03.netology.yc]
null_resource.monitoring (local-exec): ok: [node02.netology.yc]
null_resource.monitoring (local-exec): ok: [node01.netology.yc]

null_resource.monitoring (local-exec): TASK [Check Current Leader] ****************************************************
null_resource.monitoring: Still creating... [10s elapsed]
null_resource.monitoring (local-exec): ok: [node02.netology.yc]
null_resource.monitoring (local-exec): ok: [node01.netology.yc]
null_resource.monitoring (local-exec): ok: [node03.netology.yc]

null_resource.monitoring (local-exec): TASK [Run deploy, if node is leader] *******************************************
null_resource.monitoring (local-exec): skipping: [node02.netology.yc]
null_resource.monitoring (local-exec): skipping: [node03.netology.yc]
null_resource.monitoring: Still creating... [20s elapsed]
null_resource.monitoring: Still creating... [30s elapsed]
null_resource.monitoring (local-exec): changed: [node01.netology.yc]

null_resource.monitoring (local-exec): PLAY RECAP *********************************************************************
null_resource.monitoring (local-exec): node01.netology.yc         : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
null_resource.monitoring (local-exec): node02.netology.yc         : ok=2    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
null_resource.monitoring (local-exec): node03.netology.yc         : ok=2    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

null_resource.monitoring: Creation complete after 35s [id=8079840767749680531]

Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:

external_ip_address_node01 = "51.250.92.61"
external_ip_address_node02 = "51.250.74.191"
external_ip_address_node03 = "51.250.72.83"
external_ip_address_node04 = "51.250.92.155"
external_ip_address_node05 = "51.250.92.166"
external_ip_address_node06 = "51.250.89.97"
internal_ip_address_node01 = "192.168.101.11"
internal_ip_address_node02 = "192.168.101.12"
internal_ip_address_node03 = "192.168.101.13"
internal_ip_address_node04 = "192.168.101.14"
internal_ip_address_node05 = "192.168.101.15"
internal_ip_address_node06 = "192.168.101.16"