# Домашнее задание к занятию "6.4. PostgreSQL"

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

```shell
$ sudo docker run -d \
	--name postgres13 \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v /home/mankov/docker/pgsql13:/var/lib/postgresql/data \
  -p 55432:5432\
	postgres:13
```

Подключитесь к БД PostgreSQL используя `psql`.
```shell
$ psql -U postgres -p 55432
psql (14.2, server 13.7))
Type "help" for help.

postgres=# 
```

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

**Найдите и приведите** управляющие команды для:
- вывода списка БД
`\l[+]   [PATTERN]      list databases`
```shell
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)
```

- подключения к БД
`\c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}  connect to new database (currently "postgres")`
```shell
postgres=# \c
You are now connected to database "postgres" as user "postgres".

postgres=# \c template1
You are now connected to database "template1" as user "postgres".
```

- вывода списка таблиц
`\dt[S+] [PATTERN]      list tables`
```shell
template1=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# \dt
Did not find any relations.
```

- вывода описания содержимого таблиц
`\d[S+]  NAME           describe table, view, sequence, or index`

- выхода из psql
`\q                     quit psql`


## Задача 2

Используя `psql` создайте БД `test_database`.
```shell
postgres=# \h CREATE DATABASE
Command:     CREATE DATABASE
Description: create a new database
Syntax:
CREATE DATABASE name
    [ [ WITH ] [ OWNER [=] user_name ]
           [ TEMPLATE [=] template ]
           [ ENCODING [=] encoding ]
           [ LOCALE [=] locale ]
           [ LC_COLLATE [=] lc_collate ]
           [ LC_CTYPE [=] lc_ctype ]
           [ TABLESPACE [=] tablespace_name ]
           [ ALLOW_CONNECTIONS [=] allowconn ]
           [ CONNECTION LIMIT [=] connlimit ]
           [ IS_TEMPLATE [=] istemplate ] ]

URL: https://www.postgresql.org/docs/13/sql-createdatabase.html

postgres=# CREATE DATABASE test_database;
CREATE DATABASE
postgres=# \l
                                   List of databases
     Name      |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
---------------+----------+----------+------------+------------+-----------------------
 postgres      | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0     | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres
 test_database | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
(4 rows)

postgres=# \c test_database
You are now connected to database "test_database" as user "postgres".
test_database=# 
```
Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/master/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.
`\i FILE                execute commands from file`
```shell
test_database=# \cd /var/lib/postgresql
test_database=# \! ls
data  test_dump.sql

test_database=# \i test_dump.sql
SET
SET
SET
SET
SET
 set_config 
------------
 
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 8
 setval 
--------
      8
(1 row)

ALTER TABLE
```

Перейдите в управляющую консоль `psql` внутри контейнера.
```shell
$ sudo docker exec -it -u postgres postgres13 psql
psql (13.7 (Debian 13.7-1.pgdg110+1))
Type "help" for help.

postgres=# 
```

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.
```shell
postgres=# \l
                                   List of databases
     Name      |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
---------------+----------+----------+------------+------------+-----------------------
 postgres      | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0     | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
               |          |          |            |            | postgres=CTc/postgres
 test_database | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
(4 rows)

postgres=# \c test_database
You are now connected to database "test_database" as user "postgres".
test_database=# \dt
         List of relations
 Schema |  Name  | Type  |  Owner   
--------+--------+-------+----------
 public | orders | table | postgres
(1 row)

test_database=# ANALYZE VERBOSE orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
ANALYZE

```

Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.

```sql
test_database=# select attname, avg_width 
                  from pg_stats 
                 where tablename='orders' 
                   and avg_width=(select max(avg_width) 
                                    from pg_stats 
                                   where tablename='orders');
 attname | avg_width 
---------+-----------
 title   |        16
(1 row)

```

**Приведите в ответе** команду, которую вы использовали для вычисления и полученный результат.

## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам, как успешному выпускнику курсов DevOps в нетологии предложили
провести разбиение таблицы на 2 (шардировать на orders_1 - price>499 и orders_2 - price<=499).

**Данная операция называется секционирование(партицирование), шардирование из другой оперы**

Предложите SQL-транзакцию для проведения данной операции.

```sql

```

Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

```text
Можно. Необходимо создать триггер на операции вставки в таблицу, который будет проверять в какой диапазон 
попадает значение аттрибута и если есть нужная партиция, то будет выполнять вставку в существующую партицию, если нет 
то будет создавать нужную партицию и только потом выполнять вставку.
```

## Задача 4

Используя утилиту `pg_dump` создайте бекап БД `test_database`.

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
