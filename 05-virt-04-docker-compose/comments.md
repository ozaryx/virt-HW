```shell
kmankov$ yc init
Welcome! This command will take you through the configuration process.
Please go to https://oauth.yandex.ru/authorize?response_type=token&client_id=1a6990aa636648e9b2ef855fa7bec2fb in order to obtain OAuth token.

Please enter OAuth token: AQAAAAAJ7bzrAATuwb44vvmHhEBwthKSK07Uh-4
You have one cloud available: 'cloud-kmankov' (id = b1gvk0a2750nkt41jh26). It is going to be used by default.
Please choose folder to use:
 [1] default (id = b1g0k1eq7s5942g41mdq)
 [2] Create a new folder
Please enter your numeric choice: 1
Your current folder has been set to 'default' (id = b1g0k1eq7s5942g41mdq).
Do you want to configure a default Compute zone? [Y/n] 
Which zone do you want to use as a profile default?
 [1] ru-central1-a
 [2] ru-central1-b
 [3] ru-central1-c
 [4] Don't set default zone
Please enter your numeric choice: 2
Your profile default Compute zone has been set to 'ru-central1-b'.
```
```shell
~ kmankov$ yc config list
token: AQAAAAAJ7bzrAATuwb44vvmHhEBwthKSK07Uh-4
cloud-id: b1gvk0a2750nkt41jh26
folder-id: b1g0k1eq7s5942g41mdq
compute-default-zone: ru-central1-b
```
```shell
~ kmankov$ yc vpc network create \
--name net \
--labels my-label=netology \
--description "my first net" 
id: enpkoo9r2bibmt1pf6ej
folder_id: b1g0k1eq7s5942g41mdq
created_at: "2022-05-19T14:40:58Z"
name: net
description: my first net
labels:
  my-label: netology
```
```shell
~ kmankov$ yc vpc subnet create \
--name my-subnet-b \
--zone ru-central1-b \
--range 10.1.2.0/24 \
--network-name net \
--description "my subnet"
id: e2lvdvofgg9qp2f7mhm2
folder_id: b1g0k1eq7s5942g41mdq
created_at: "2022-05-19T14:44:40Z"
name: my-subnet-b
description: my subnet
network_id: enpkoo9r2bibmt1pf6ej
zone_id: ru-central1-b
v4_cidr_blocks:
- 10.1.2.0/24
```
```shell
kmankov$ packer validate centos-7-base.json 
The configuration is valid.
macbook0P0LYWK:packer kmankov$ packer build centos-7-base.json 
yandex: output will be in this color.

==> yandex: Creating temporary RSA SSH key for instance...
==> yandex: Using as source image: fd8rdcd74jho9ssh779e (name: "centos-7-v20220519", family: "centos-7")
==> yandex: Use provided subnet id e2lvdvofgg9qp2f7mhm2
==> yandex: Creating disk...
==> yandex: Creating instance...
...
==> yandex: Stopping instance...
==> yandex: Deleting instance...
    yandex: Instance has been deleted!
==> yandex: Creating image: centos-7-base
==> yandex: Waiting for image to complete...
==> yandex: Success image create...
==> yandex: Destroying boot disk...
    yandex: Disk has been deleted!
Build 'yandex' finished after 1 minute 55 seconds.

==> Wait completed after 1 minute 55 seconds

==> Builds finished. The artifacts of successful builds are:
--> yandex: A disk image was created: centos-7-base (id: fd826sg2hrkicviib73p) with family name centos
```
```shell
kmankov$ yc compute image list
+----------------------+---------------+--------+----------------------+--------+
|          ID          |     NAME      | FAMILY |     PRODUCT IDS      | STATUS |
+----------------------+---------------+--------+----------------------+--------+
| fd826sg2hrkicviib73p | centos-7-base | centos | f2e99agij1uhrk2ioilk | READY  |
+----------------------+---------------+--------+----------------------+--------+
```

```shell
kmankov$ yc iam key create --service-account-name terraform -o key.json
id: ajev8pdvndpdi8qbaauo
service_account_id: ajev66fh3q56tinitvfn
created_at: "2022-05-19T16:35:54.591278166Z"
key_algorithm: RSA_2048
```