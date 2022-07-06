# Домашнее задание к занятию "7.1. Инфраструктура как код"

## Задача 1. Выбор инструментов. 
 
### Легенда
 
Через час совещание на котором менеджер расскажет о новом проекте. Начать работу над которым надо 
будет уже сегодня. 
На данный момент известно, что это будет сервис, который ваша компания будет предоставлять внешним заказчикам.
Первое время, скорее всего, будет один внешний клиент, со временем внешних клиентов станет больше.

Так же по разговорам в компании есть вероятность, что техническое задание еще не четкое, что приведет к большому
количеству небольших релизов, тестирований интеграций, откатов, доработок, то есть скучно не будет.  
   
Вам, как девопс инженеру, будет необходимо принять решение об инструментах для организации инфраструктуры.
На данный момент в вашей компании уже используются следующие инструменты: 
- остатки СloudFormation, 
- некоторые образы сделаны при помощи Packer,
- год назад начали активно использовать Terraform, 
- разработчики привыкли использовать Docker, 
- уже есть большая база Kubernetes конфигураций, 
- для автоматизации процессов используется Teamcity, 
- также есть совсем немного Ansible скриптов, 
- и ряд bash скриптов для упрощения рутинных задач.  

Для этого в рамках совещания надо будет выяснить подробности о проекте, что бы в итоге определиться с инструментами:

1. Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?
1. Будет ли центральный сервер для управления инфраструктурой?
1. Будут ли агенты на серверах?
1. Будут ли использованы средства для управления конфигурацией или инициализации ресурсов? 
 
В связи с тем, что проект стартует уже сегодня, в рамках совещания надо будет определиться со всеми этими вопросами.

### В результате задачи необходимо

1. Ответить на четыре вопроса представленных в разделе "Легенда". 
1. Какие инструменты из уже используемых вы хотели бы использовать для нового проекта? 
1. Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта? 

Если для ответа на эти вопросы недостаточно информации, то напишите какие моменты уточните на совещании.

**Ответ**
1. Лучше всего использовать изменяемую инфраструктуру, но весь код инфраструктуры необходимо хранить в VCS, можно будет разворачивать и откатывать изменения в инфрастуктуре. Также такой подход позволит избежать configuration drift (незадокументированных изменений инфраструктуры) на этапе становления системы.
2. Центральный сервер на данном этапе не нужен - заказчик один, серверов скорее всего будет не так много, и отвлекаться на поддержку центрального сервера на данном этапе нет необходимости.
3. Будут использованы агенты системы мониторинга, агенты управления конфигурацией использоваться не будут.
4. Будут использованы средства для управления конфигурацией - Kubernetes и инициализации ресурсов - Terraform.

- Максимально будут использоваться уже известные инструменты Terraform - разворачивание виртуальной среды, Docker - упаковка приложений, Teamcity - автоматизация процессов, Kubernetes - для управления конфигурацией/инфраструктурой.
- Новые инструменты будут рассматриваться по ходу проекта при необходимости решения задач по мере поступления.

## Задача 2. Установка терраформ. 

Официальный сайт: https://www.terraform.io/

Установите терраформ при помощи менеджера пакетов используемого в вашей операционной системе.
В виде результата этой задачи приложите вывод команды `terraform --version`.

```
$ brew install terraform

$ terraform --version
Terraform v1.2.4
on darwin_amd64
+ provider registry.terraform.io/hashicorp/local v2.2.3
+ provider registry.terraform.io/hashicorp/null v3.1.1
+ provider registry.terraform.io/yandex-cloud/yandex v0.74.0
```

## Задача 3. Поддержка легаси кода. 

В какой-то момент вы обновили терраформ до новой версии, например с 0.12 до 0.13. 
А код одного из проектов настолько устарел, что не может работать с версией 0.13. 
В связи с этим необходимо сделать так, чтобы вы могли одновременно использовать последнюю версию терраформа установленную при помощи
штатного менеджера пакетов и устаревшую версию 0.12. 

В виде результата этой задачи приложите вывод `--version` двух версий терраформа доступных на вашем компьютере 
или виртуальной машине.

Можно использовать tfenv
```
$ brew install tfenv

$ tfenv install 1.1.9
Installing Terraform v1.1.9
...
Installation of terraform v1.1.9 successful. To make this your default version, run 'tfenv use 1.1.9'

$ tfenv use 1.1.9
Switching default version to v1.1.9
Switching completed

$ terraform --version
Terraform v1.1.9
on darwin_amd64
+ provider registry.terraform.io/hashicorp/local v2.2.3
+ provider registry.terraform.io/hashicorp/null v3.1.1
+ provider registry.terraform.io/yandex-cloud/yandex v0.74.0

$ tfenv install latest
Installing Terraform v1.2.4
...
Installation of terraform v1.2.4 successful. To make this your default version, run 'tfenv use 1.2.4'

$ tfenv use 1.2.4
Switching default version to v1.2.4
Switching completed

$ terraform --version
Terraform v1.2.4
on darwin_amd64
+ provider registry.terraform.io/hashicorp/local v2.2.3
+ provider registry.terraform.io/hashicorp/null v3.1.1
+ provider registry.terraform.io/yandex-cloud/yandex v0.74.0
```

Также есть инструмент tfswitch

Также можно установить терраформ из архивов в разные каталоги, и сделать линки на разные версии. Линк terraform можно сделать на версию по умолчанию.
```
~# mkdir -p /usr/local/tf
~# mkdir -p /usr/local/tf/12
~# mkdir -p /usr/local/tf/13

~# cd /usr/local/tf/12/
/usr/local/tf/12# wget https://hashicorp-releases.website.yandexcloud.net/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip
/usr/local/tf/12# unzip terraform_0.12.0_linux_amd64.zip

/usr/local/tf/12# cd /usr/local/tf/13/
/usr/local/tf/13# wget https://hashicorp-releases.website.yandexcloud.net/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
/usr/local/tf/13# unzip terraform_0.13.0_linux_amd64.zip

~# ln -s /usr/local/tf/12/terraform /usr/bin/terraform12
~# ln -s /usr/local/tf/13/terraform /usr/bin/terraform13
~# ln -s /usr/local/tf/13/terraform /usr/bin/terraform

~# terraform12 --version
Terraform v0.12.0

Your version of Terraform is out of date! The latest version
is 1.2.3. You can update by downloading from www.terraform.io/downloads.html

~# terraform13 --version
Terraform v0.13.0

Your version of Terraform is out of date! The latest version
is 1.2.3. You can update by downloading from https://www.terraform.io/downloads.html

~# terraform --version
Terraform v0.13.0

Your version of Terraform is out of date! The latest version
is 1.2.3. You can update by downloading from https://www.terraform.io/downloads.html
```
---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
