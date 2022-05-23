```
macbook0P0LYWK:terraform kmankov$ terraform init
```
```Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Finding latest version of hashicorp/local...
- Finding latest version of yandex-cloud/yandex...
- Installing hashicorp/local v2.2.3...
- Installed hashicorp/local v2.2.3 (signed by HashiCorp)
- Installing yandex-cloud/yandex v0.74.0...
- Installed yandex-cloud/yandex v0.74.0 (self-signed, key ID E40F590B50BB8E40)
- Installing hashicorp/null v3.1.1...
- Installed hashicorp/null v3.1.1 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.```

```
```
macbook0P0LYWK:terraform kmankov$ terraform validate

Success! The configuration is valid.
```

```macbook0P0LYWK:terraform kmankov$ terraform plan
```
```Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
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

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run 
"terraform apply" now.
```