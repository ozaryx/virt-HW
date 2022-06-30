# Домашнее задание к занятию "6.5. Elasticsearch"

## Задача 1

В этом задании вы потренируетесь в:
- установке elasticsearch
- первоначальном конфигурировании elastcisearch
- запуске elasticsearch в docker

Используя докер образ [centos:7](https://hub.docker.com/_/centos) как базовый и 
[документацию по установке и запуску Elastcisearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/targz.html):

- составьте Dockerfile-манифест для elasticsearch
- соберите docker-образ и сделайте `push` в ваш docker.io репозиторий
- запустите контейнер из получившегося образа и выполните запрос пути `/` c хост-машины

Требования к `elasticsearch.yml`:
- данные `path` должны сохраняться в `/var/lib`
- имя ноды должно быть `netology_test`

В ответе приведите:
- текст Dockerfile манифеста
- ссылку на образ в репозитории dockerhub
- ответ `elasticsearch` на запрос пути `/` в json виде

Подсказки:
- возможно вам понадобится установка пакета perl-Digest-SHA для корректной работы пакета shasum
- при сетевых проблемах внимательно изучите кластерные и сетевые настройки в elasticsearch.yml
- при некоторых проблемах вам поможет docker директива ulimit
- elasticsearch в логах обычно описывает проблему и пути ее решения

Далее мы будем работать с данным экземпляром elasticsearch.

**Ответ:**

- текст Dockerfile манифеста  
```shell
#6.5. Elasticsearch
FROM centos:7
LABEL ElasticSearch Lab 6.5

ENV PATH=/usr/lib:/usr/lib/jvm/jre-11/bin:$PATH

RUN yum install wget -y 

RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.2.3-linux-x86_64.tar.gz \
    && wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.2.3-linux-x86_64.tar.gz.sha512 

RUN yum install perl-Digest-SHA -y 

RUN shasum -a 512 -c elasticsearch-8.2.3-linux-x86_64.tar.gz.sha512 \ 
    && tar -xzf elasticsearch-8.2.3-linux-x86_64.tar.gz \
    && yum upgrade -y
    
ADD elasticsearch.yml /elasticsearch-8.2.3/config/

ENV ES_HOME=/elasticsearch-8.2.3

RUN groupadd elasticsearch \
    && useradd -g elasticsearch elasticsearch
    
RUN mkdir /var/lib/logs \
    && chown elasticsearch:elasticsearch /var/lib/logs \
    && mkdir /var/lib/data \
    && chown elasticsearch:elasticsearch /var/lib/data \
    && chown -R elasticsearch:elasticsearch /elasticsearch-8.2.3/

RUN mkdir /elasticsearch-8.2.3/snapshots &&\
    chown elasticsearch:elasticsearch /elasticsearch-8.2.3/snapshots
    
USER elasticsearch
CMD ["/elasticsearch-8.2.3/bin/elasticsearch"]
```

```shell
sudo docker build kmankov/myrepo:els-8.2.3 .
sudo docker push kmankov/myrepo:els-8.2.3
```

- ссылку на образ в репозитории dockerhub  
```shell
sudo docker pull kmankov/myrepo:els-8.2.3
```

- ответ `elasticsearch` на запрос пути `/` в json виде
```shell
@fedora ~/docker/elasticsearch
$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks https://localhost:9200/
```
```json
{
  "name" : "faf3ee0eeb4b",
  "cluster_name" : "netology_test",
  "cluster_uuid" : "rv05jyulR2qsTxx5Jh1TyQ",
  "version" : {
    "number" : "8.2.3",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "9905bfb62a3f0b044948376b4f607f70a8a151b4",
    "build_date" : "2022-06-08T22:21:36.455508792Z",
    "build_snapshot" : false,
    "lucene_version" : "9.1.0",
    "minimum_wire_compatibility_version" : "7.17.0",
    "minimum_index_compatibility_version" : "7.0.0"
  },
  "tagline" : "You Know, for Search"
}
```

## Задача 2

В этом задании вы научитесь:
- создавать и удалять индексы
- изучать состояние кластера
- обосновывать причину деградации доступности данных

Ознакомтесь с [документацией](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html) 
и добавьте в `elasticsearch` 3 индекса, в соответствии со таблицей:

| Имя | Количество реплик | Количество шард |
|-----|-------------------|-----------------|
| ind-1| 0 | 1 |
| ind-2 | 1 | 2 |
| ind-3 | 2 | 4 |

Получите список индексов и их статусов, используя API и **приведите в ответе** на задание.

Получите состояние кластера `elasticsearch`, используя API.

Как вы думаете, почему часть индексов и кластер находится в состоянии yellow?

Удалите все индексы.

**Важно**

При проектировании кластера elasticsearch нужно корректно рассчитывать количество реплик и шард,
иначе возможна потеря данных индексов, вплоть до полной, при деградации системы.

**Ответы**

Создать индексы
```shell
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/ind-1?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 1,  
      "number_of_replicas": 0 
    }
  }
}
'
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "ind-1"
}

$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/ind-2?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 2,  
      "number_of_replicas": 1 
    }
  }
}
'
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "ind-2"
}

$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/ind-3?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 4,  
      "number_of_replicas": 2 
    }
  }
}
'
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "ind-3"
}
```
Получить список и статус индексов
```shell
$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true'
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
yellow open   ind-3 GO1rvmovScefWBMdkD5NVg   4   2          0            0        900            900
yellow open   ind-2 _lgadsXgQTWjzPd0hOn1Iw   2   1          0            0        450            450
green  open   ind-1 Q82aeXyeS_mrAPrifSQTdA   1   0          0            0        225            225
```
Получить статус кластера
```shell
$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cluster/health?pretty'
{
  "cluster_name" : "netology_test",
  "status" : "yellow",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 8,
  "active_shards" : 8,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 10,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 44.44444444444444
}
```

Часть индексов и кластер находится в состоянии yellow потому что кластер состоит из одного узла и не все реплики индексов запущены.
```shell
$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/shards?v=true'
index       shard prirep state      docs store ip         node
ind-1       0     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-3       0     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-3       0     r      UNASSIGNED                       
ind-3       0     r      UNASSIGNED                       
ind-3       1     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-3       1     r      UNASSIGNED                       
ind-3       1     r      UNASSIGNED                       
ind-3       2     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-3       2     r      UNASSIGNED                       
ind-3       2     r      UNASSIGNED                       
ind-3       3     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-3       3     r      UNASSIGNED                       
ind-3       3     r      UNASSIGNED                       
ind-2       0     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-2       0     r      UNASSIGNED                       
ind-2       1     p      STARTED       0  225b 172.17.0.2 faf3ee0eeb4b
ind-2       1     r      UNASSIGNED                       
.security-7 0     p      STARTED               172.17.0.2 faf3ee0eeb4b
```
Удалить индексы
```
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X DELETE "https://localhost:9200/ind-1,ind-2,ind-3?pretty"
{
  "acknowledged" : true
}

$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true'
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
```

## Задача 3

В данном задании вы научитесь:
- создавать бэкапы данных
- восстанавливать индексы из бэкапов

Создайте директорию `{путь до корневой директории с elasticsearch в образе}/snapshots`.

Используя API [зарегистрируйте](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html#snapshots-register-repository) 
данную директорию как `snapshot repository` c именем `netology_backup`.

**Приведите в ответе** запрос API и результат вызова API для создания репозитория.

Создайте индекс `test` с 0 реплик и 1 шардом и **приведите в ответе** список индексов.

[Создайте `snapshot`](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-take-snapshot.html) 
состояния кластера `elasticsearch`.

**Приведите в ответе** список файлов в директории со `snapshot`ами.

Удалите индекс `test` и создайте индекс `test-2`. **Приведите в ответе** список индексов.

[Восстановите](https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-restore-snapshot.html) состояние
кластера `elasticsearch` из `snapshot`, созданного ранее. 

**Приведите в ответе** запрос к API восстановления и итоговый список индексов.

Подсказки:
- возможно вам понадобится доработать `elasticsearch.yml` в части директивы `path.repo` и перезапустить `elasticsearch`

**Ответ**

Создать репозиторий
```shell
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/_snapshot/netology_backup?pretty" -H 'Content-Type: application/json' -d'
{
  "type": "fs",
  "settings": {
    "location": "/elasticsearch-8.2.3/snapshots"
  }
}
'
{
  "acknowledged" : true
}
```

Создать индекс
```
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/test?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 1,  
      "number_of_replicas": 0 
    }
  }
}
'
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "test"
}

$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true'
health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test  MfpBPe6VT3G6QnwYIs9b9A   1   0          0            0        225            225
```

Список снапшотов
```
$ sudo docker exec -ti festive_elbakyan bash
[elasticsearch@faf3ee0eeb4b /]$ ls -l /elasticsearch-8.2.3/snapshots/
total 32
-rw-rw-r-- 1 elasticsearch elasticsearch   841 Jun 28 04:11 index-0
-rw-rw-r-- 1 elasticsearch elasticsearch     8 Jun 28 04:11 index.latest
drwxrwxr-x 1 elasticsearch elasticsearch    88 Jun 28 04:11 indices
-rw-rw-r-- 1 elasticsearch elasticsearch 18202 Jun 28 04:11 meta-6mkYZhkBR_2yG4vKC2-_4g.dat
-rw-rw-r-- 1 elasticsearch elasticsearch   351 Jun 28 04:11 snap-6mkYZhkBR_2yG4vKC2-_4g.dat
```

Удалть индекс test. Создать индекс test-2
```
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X DELETE "https://localhost:9200/test?pretty"
{
  "acknowledged" : true
}

$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X PUT "https://localhost:9200/test-2?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "index": {
      "number_of_shards": 1,  
      "number_of_replicas": 0 
    }
  }
}
'
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "test-2"
}

$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true'
health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test-2 cNSsHStLTRGdx2LehzgnYQ   1   0          0            0        225            225
```

Восстановить состояние кластера
```
$ curl -k -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -X POST 'https://localhost:9200/_snapshot/netology_backup/test_snapshot/_restore?pretty'
{
  "accepted" : true
}

$ curl -u elastic:Ms_qm1IbHYjvc9aw4Zl_ -ks 'https://localhost:9200/_cat/indices?bytes=b&s=store.size:desc,index:asc&v=true'
health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
green  open   test   XrY1LjMISImnm0nL8IQmMg   1   0          0            0        225            225
green  open   test-2 cNSsHStLTRGdx2LehzgnYQ   1   0          0            0        225            225

```


---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
