# Домашнее задание к занятию "7.5. Основы golang"

С `golang` в рамках курса, мы будем работать не много, поэтому можно использовать любой IDE. 
Но рекомендуем ознакомиться с [GoLand](https://www.jetbrains.com/ru-ru/go/).  

## Задача 1. Установите golang.
1. Воспользуйтесь инструкций с официального сайта: [https://golang.org/](https://golang.org/).
2. Так же для тестирования кода можно использовать песочницу: [https://play.golang.org/](https://play.golang.org/).

**Ответ**

1.
```
$ wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
$ sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
$ export PATH=$PATH:/usr/local/go/bin
$ go version
go version go1.18.3 linux/amd64
```

## Задача 2. Знакомство с gotour.
У Golang есть обучающая интерактивная консоль [https://tour.golang.org/](https://tour.golang.org/). 
Рекомендуется изучить максимальное количество примеров. В консоли уже написан необходимый код, 
осталось только с ним ознакомиться и поэкспериментировать как написано в инструкции в левой части экрана.  

**Ответ**

Освоено

## Задача 3. Написание кода. 
Цель этого задания закрепить знания о базовом синтаксисе языка. Можно использовать редактор кода 
на своем компьютере, либо использовать песочницу: [https://play.golang.org/](https://play.golang.org/).

1. Напишите программу для перевода метров в футы (1 фут = 0.3048 метр). Можно запросить исходные данные 
у пользователя, а можно статически задать в коде.
    Для взаимодействия с пользователем можно использовать функцию `Scanf`:
    ```
    package main
    
    import "fmt"
    
    func main() {
        fmt.Print("Enter a number: ")
        var input float64
        fmt.Scanf("%f", &input)
    
        output := input * 2
    
        fmt.Println(output)    
    }
    ```
 
1. Напишите программу, которая найдет наименьший элемент в любом заданном списке, например:
    ```
    x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
    ```
1. Напишите программу, которая выводит числа от 1 до 100, которые делятся на 3. То есть `(3, 6, 9, …)`.

В виде решения ссылку на код или сам код. 

**Ответ**

1. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/m2f.go

```
$ go build m2f.go

$ ./m2f
Enter a number: 1
3.280839895013123

$ ./m2f
Enter a number: 5
16.404199475065617
```

2. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/min.go

```
$ go build min.go
$ ./min
9
```
3. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/div3.go

```
$ go build div3.go 
$ ./div3
[3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96 99]
```

## Задача 4. Протестировать код (не обязательно).

Создайте тесты для функций из предыдущего задания. 

1. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/m2f_test.go
```
$ go test -v
=== RUN   TestM2f
--- PASS: TestM2f (0.00s)
PASS
ok  	_/home/mankov/go/m2f	0.002s
```

2. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/min_test.go
```
$ go test -v
=== RUN   TestMin
--- PASS: TestMin (0.00s)
PASS
ok  	_/home/mankov/go/min	0.002s
```

3. https://github.com/ozaryx/virt-HW/blob/main/07-terraform-05-golang/src/div3_test.go
```
$ vi div3_test.go
$ go test -v
=== RUN   TestDiv3
--- PASS: TestDiv3 (0.00s)
PASS
ok  	_/home/mankov/go/div3	0.002s
```

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---

