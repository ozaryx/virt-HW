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

```sql
mysql> SET profiling = 1;
Query OK, 0 rows affected, 1 warning (0.00 sec)
```
```sql
mysql> SHOW PROFILES;
Empty set, 1 warning (0.18 sec)

mysql> select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test';
+------+------+---------------------------------------+
| USER | HOST | ATTRIBUTE                             |
+------+------+---------------------------------------+
| test | %    | {"fname": "James", "lname": "Pretty"} |
+------+------+---------------------------------------+
1 row in set (0.14 sec)

mysql> SHOW PROFILES;
+----------+------------+----------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                |
+----------+------------+----------------------------------------------------------------------+
|        1 | 0.13362575 | select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test' |
+----------+------------+----------------------------------------------------------------------+
1 row in set, 1 warning (0.00 sec)

mysql> SHOW PROFILE FOR QUERY 1;
+--------------------------------+----------+
| Status                         | Duration |
+--------------------------------+----------+
| starting                       | 0.000092 |
| Executing hook on transaction  | 0.000007 |
| starting                       | 0.000007 |
| checking permissions           | 0.000006 |
| Opening tables                 | 0.000125 |
| init                           | 0.000006 |
| System lock                    | 0.000007 |
| optimizing                     | 0.000052 |
| statistics                     | 0.000034 |
| preparing                      | 0.000021 |
| executing                      | 0.000039 |
| checking permissions           | 0.000032 |
| end                            | 0.000004 |
| query end                      | 0.000004 |
| waiting for handler commit     | 0.000009 |
| closing tables                 | 0.000011 |
| freeing items                  | 0.000022 |
| cleaning up                    | 0.000010 |
+--------------------------------+----------+
18 rows in set, 1 warning (0.00 sec)

```

Исследуйте, какой `engine` используется в таблице БД `test_db` и **приведите в ответе**.

```sql
mysql> show engines;
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| Engine             | Support | Comment                                                        | Transactions | XA   | Savepoints |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+
| FEDERATED          | NO      | Federated MySQL storage engine                                 | NULL         | NULL | NULL       |
| MEMORY             | YES     | Hash based, stored in memory, useful for temporary tables      | NO           | NO   | NO         |
| InnoDB             | DEFAULT | Supports transactions, row-level locking, and foreign keys     | YES          | YES  | YES        |
| PERFORMANCE_SCHEMA | YES     | Performance Schema                                             | NO           | NO   | NO         |
| MyISAM             | YES     | MyISAM storage engine                                          | NO           | NO   | NO         |
| MRG_MYISAM         | YES     | Collection of identical MyISAM tables                          | NO           | NO   | NO         |
| BLACKHOLE          | YES     | /dev/null storage engine (anything you write to it disappears) | NO           | NO   | NO         |
| CSV                | YES     | CSV storage engine                                             | NO           | NO   | NO         |
| ARCHIVE            | YES     | Archive storage engine                                         | NO           | NO   | NO         |
+--------------------+---------+----------------------------------------------------------------+--------------+------+------------+

Для таблиц БД test_db используется engine InnoDB
```sql
mysql> SHOW TABLE STATUS in test_db;
+--------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+---------------------+------------+--------------------+----------+----------------+---------+
| Name   | Engine | Version | Row_format | Rows | Avg_row_length | Data_length | Max_data_length | Index_length | Data_free | Auto_increment | Create_time         | Update_time         | Check_time | Collation          | Checksum | Create_options | Comment |
+--------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+---------------------+------------+--------------------+----------+----------------+---------+
| orders | InnoDB |      10 | Dynamic    |    5 |           3276 |       16384 |               0 |            0 |         0 |              6 | 2022-05-24 08:14:29 | 2022-05-24 08:14:30 | NULL       | utf8mb4_0900_ai_ci |     NULL |                |         |
+--------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+---------------------+------------+--------------------+----------+----------------+---------+
1 row in set (0.04 sec)

```
Измените `engine` и **приведите время выполнения и запрос на изменения из профайлера в ответе**:
- на `MyISAM`
- на `InnoDB`

```sql
mysql> ALTER TABLE orders ENGINE = MyISAM;
Query OK, 5 rows affected (3.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> show profiles;
+----------+------------+----------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                |
+----------+------------+----------------------------------------------------------------------+
|        1 | 0.13362575 | select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test' |
|        2 | 0.00060325 | show engines                                                         |
|        3 | 0.00021200 | show engine                                                          |
|        4 | 0.00048575 | select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test' |
|        5 | 0.00052425 | show engines                                                         |
|        6 | 0.39078550 | show engine InnoDB status                                            |
|        7 | 0.00006550 | SHOW TABLE STATUS orders                                             |
|        8 | 0.00006025 | SHOW TABLE STATUS test.orders                                        |
|        9 | 0.00016950 | SHOW TABLE STATUS in test.orders                                     |
|       10 | 0.00032900 | SHOW TABLE STATUS in orders                                          |
|       11 | 0.03496625 | SHOW TABLE STATUS in test                                            |
|       12 | 3.02069000 | ALTER TABLE orders ENGINE = MyISAM                                   |
+----------+------------+----------------------------------------------------------------------+
12 rows in set, 1 warning (0.00 sec)

mysql> show profile for query 12;
+--------------------------------+----------+
| Status                         | Duration |
+--------------------------------+----------+
| starting                       | 0.000096 |
| Executing hook on transaction  | 0.000007 |
| starting                       | 0.000229 |
| checking permissions           | 0.000010 |
| checking permissions           | 0.000010 |
| init                           | 0.000009 |
| Opening tables                 | 0.000485 |
| setup                          | 0.000129 |
| creating table                 | 0.531263 |
| waiting for handler commit     | 0.000047 |
| waiting for handler commit     | 0.265351 |
| After create                   | 0.000701 |
| System lock                    | 0.000012 |
| copy to tmp table              | 0.199632 |
| waiting for handler commit     | 0.000065 |
| waiting for handler commit     | 0.000045 |
| waiting for handler commit     | 0.000087 |
| rename result table            | 0.000223 |
| waiting for handler commit     | 1.257395 |
| waiting for handler commit     | 0.000016 |
| waiting for handler commit     | 0.169745 |
| waiting for handler commit     | 0.000015 |
| waiting for handler commit     | 0.195430 |
| waiting for handler commit     | 0.000015 |
| waiting for handler commit     | 0.054685 |
| end                            | 0.313459 |
| query end                      | 0.031275 |
| closing tables                 | 0.000019 |
| waiting for handler commit     | 0.000023 |
| freeing items                  | 0.000138 |
| cleaning up                    | 0.000077 |
+--------------------------------+----------+
31 rows in set, 1 warning (0.00 sec)

```

```sql
mysql> ALTER TABLE orders ENGINE = InnoDB;
Query OK, 5 rows affected (0.22 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> show profiles;
+----------+------------+----------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                |
+----------+------------+----------------------------------------------------------------------+
|        1 | 0.13362575 | select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test' |
|        2 | 0.00060325 | show engines                                                         |
|        3 | 0.00021200 | show engine                                                          |
|        4 | 0.00048575 | select * from INFORMATION_SCHEMA.USER_ATTRIBUTES where user = 'test' |
|        5 | 0.00052425 | show engines                                                         |
|        6 | 0.39078550 | show engine InnoDB status                                            |
|        7 | 0.00006550 | SHOW TABLE STATUS orders                                             |
|        8 | 0.00006025 | SHOW TABLE STATUS test.orders                                        |
|        9 | 0.00016950 | SHOW TABLE STATUS in test.orders                                     |
|       10 | 0.00032900 | SHOW TABLE STATUS in orders                                          |
|       11 | 0.03496625 | SHOW TABLE STATUS in test                                            |
|       12 | 3.02069000 | ALTER TABLE orders ENGINE = MyISAM                                   |
|       13 | 0.21993725 | ALTER TABLE orders ENGINE = InnoDB                                   |
+----------+------------+----------------------------------------------------------------------+
13 rows in set, 1 warning (0.00 sec)

mysql> show profile for query 13;
+--------------------------------+----------+
| Status                         | Duration |
+--------------------------------+----------+
| starting                       | 0.000089 |
| Executing hook on transaction  | 0.000005 |
| starting                       | 0.000014 |
| checking permissions           | 0.000005 |
| checking permissions           | 0.000004 |
| init                           | 0.000010 |
| Opening tables                 | 0.000197 |
| setup                          | 0.000069 |
| creating table                 | 0.000067 |
| After create                   | 0.042161 |
| System lock                    | 0.000020 |
| copy to tmp table              | 0.000115 |
| rename result table            | 0.000689 |
| waiting for handler commit     | 0.000008 |
| waiting for handler commit     | 0.002215 |
| waiting for handler commit     | 0.000011 |
| waiting for handler commit     | 0.142411 |
| waiting for handler commit     | 0.000017 |
| waiting for handler commit     | 0.003391 |
| waiting for handler commit     | 0.000054 |
| waiting for handler commit     | 0.025989 |
| end                            | 0.000603 |
| query end                      | 0.001662 |
| closing tables                 | 0.000015 |
| waiting for handler commit     | 0.000025 |
| freeing items                  | 0.000022 |
| cleaning up                    | 0.000073 |
+--------------------------------+----------+
27 rows in set, 1 warning (0.00 sec)

```

```sql
mysql> ALTER TABLE orders ENGINE = MyISAM;
Query OK, 5 rows affected (0.18 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE orders ENGINE = InnoDB;
Query OK, 5 rows affected (0.08 sec)
Records: 5  Duplicates: 0  Warnings: 0
```


## Задача 4 

Изучите файл `my.cnf` в директории /etc/mysql.

```shell
root@21fb410560ff:/# more /etc/mysql/my.cnf
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
secure-file-priv= NULL

# Custom config should go here
!includedir /etc/mysql/conf.d/
```

Измените его согласно ТЗ (движок InnoDB):
- Скорость IO важнее сохранности данных
- Нужна компрессия таблиц для экономии места на диске
- Размер буффера с незакомиченными транзакциями 1 Мб
- Буффер кеширования 30% от ОЗУ
- Размер файла логов операций 100 Мб

Приведите в ответе измененный файл `my.cnf`.

```shell
root@21fb410560ff:/# cat /proc/meminfo | grep MemTotal
MemTotal:        4015632 kB
```

```shell
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
secure-file-priv= NULL

# Скорость IO важнее сохранности данных


# Нужна компрессия таблиц для экономии места на диске


# Размер буффера с незакомиченными транзакциями 1 Мб



# Буффер кеширования 30% от ОЗУ
Innodb_buffer_pool_bytes_data = 1204689

# Размер файла логов операций 100 Мб


# Custom config should go here
!includedir /etc/mysql/conf.d/
```

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
