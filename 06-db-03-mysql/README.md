# Домашнее задание к занятию "6.3. MySQL"

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/tree/master/additional/README.md).

## Задача 1

Используя docker поднимите инстанс MySQL (версию 8). Данные БД сохраните в volume.

```shell
$ sudo docker run --name mysql -v /home/mankov/docker/mysql/data:/var/lib/mysql -v /home/mankov/docker/mysql/backup:/backup -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -p 33060:33060 -d mysql
21fb410560ff583f8aa37767e22a9caf263dc866a325b7d34c1250374b194fa0
 
$ ss -tnl
State                      Recv-Q         Send-Q           Local Address:Port              Peer Address:Port
LISTEN                     0              4096             0.0.0.0:33060                   0.0.0.0:*
LISTEN                     0              4096             0.0.0.0:3306                    0.0.0.0:*
LISTEN                     0              4096             [::]:33060                      [::]:*
LISTEN                     0              4096             [::]:3306                       [::]:*

mankov@fedora ~/docker/mysql
$ sudo docker ps 
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                                                                      NAMES
21fb410560ff   mysql     "docker-entrypoint.s…"   34 seconds ago   Up 31 seconds   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 0.0.0.0:33060->33060/tcp, :::33060->33060/tcp   mysql

```

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/master/06-db-03-mysql/test_data) и 
восстановитесь из него.

```shell
$ mysql --database=test_db  < "/home/mankov/docker/mysql/backup/test_dump.sql"
03:14:30 PM Import of /home/mankov/docker/mysql/backup/test_dump.sql has finished
```

Перейдите в управляющую консоль `mysql` внутри контейнера.

Используя команду `\h` получите список управляющих команд.

Найдите команду для выдачи статуса БД и **приведите в ответе** из ее вывода версию сервера БД.

```shell
mysql> status
--------------
mysql  Ver 8.0.29 for Linux on x86_64 (MySQL Community Server - GPL)

...
Server version:		8.0.29 MySQL Community Server - GPL
...
```

Подключитесь к восстановленной БД и получите список таблиц из этой БД.

```shell
mysql> use test_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show  tables;
+----------------+
| Tables_in_test |
+----------------+
| orders         |
+----------------+
1 row in set (0.00 sec)

```

**Приведите в ответе** количество записей с `price` > 300.

```sql
mysql> select count(*) from orders where price > 300;
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.00 sec)

```

В следующих заданиях мы будем продолжать работу с данным контейнером.

## Задача 2

Создайте пользователя test в БД c паролем test-pass, используя:
- плагин авторизации mysql_native_password
- срок истечения пароля - 180 дней 
- количество попыток авторизации - 3 
- максимальное количество запросов в час - 100
- аттрибуты пользователя:
    - Фамилия "Pretty"
    - Имя "James"

```sql
mysql> CREATE USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'test-pass'
    ->  WITH MAX_QUERIES_PER_HOUR 100 PASSWORD EXPIRE INTERVAL 180 DAY  FAILED_LOGIN_ATTEMPTS 3 
    ->  ATTRIBUTE '{"fname": "James", "lname": "Pretty"}';
Query OK, 0 rows affected (0.04 sec)

```

Предоставьте привелегии пользователю `test` на операции SELECT базы `test_db`.

```sql
mysql> grant select on test_db.* to 'test'@'%';
Query OK, 0 rows affected (0.19 sec)

```
    
Используя таблицу INFORMATION_SCHEMA.USER_ATTRIBUTES получите данные по пользователю `test` и 
**приведите в ответе к задаче**.

```sql
mysql> select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test';
+------+------+---------------------------------------+
| USER | HOST | ATTRIBUTE                             |
+------+------+---------------------------------------+
| test | %    | {"fname": "James", "lname": "Pretty"} |
+------+------+---------------------------------------+
1 row in set (0.00 sec)
```

## Задача 3

Установите профилирование `SET profiling = 1`.
Изучите вывод профилирования команд `SHOW PROFILES;`.

Исследуйте, какой `engine` используется в таблице БД `test_db` и **приведите в ответе**.

Измените `engine` и **приведите время выполнения и запрос на изменения из профайлера в ответе**:
- на `MyISAM`
- на `InnoDB`

## Задача 4 

Изучите файл `my.cnf` в директории /etc/mysql.

Измените его согласно ТЗ (движок InnoDB):
- Скорость IO важнее сохранности данных
- Нужна компрессия таблиц для экономии места на диске
- Размер буффера с незакомиченными транзакциями 1 Мб
- Буффер кеширования 30% от ОЗУ
- Размер файла логов операций 100 Мб

Приведите в ответе измененный файл `my.cnf`.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
