"""> ## ЗАДАНИЕ 1.
  > ## Установите R-пакет под названием abjData из репозитория CRAN. Загрузите его и изучите содержимое 
  > ##таблицы assuntos. Данные для какой страны в ней представлены?
  > 
  > library('abjData')
Error in library("abjData") : there is no package called ‘abjData’
> library(abjData)
Error in library(abjData) : there is no package called ‘abjData’
> install.packages("abjData")
Installing package into ‘/cloud/lib/x86_64-pc-linux-gnu-library/4.3’
(as ‘lib’ is unspecified)
trying URL 'http://rspm/default/__linux__/focal/latest/src/contrib/abjData_1.1.2.tar.gz'
Content type 'application/x-gzip' length 3969670 bytes (3.8 MB)
==================================================
  downloaded 3.8 MB

* installing *binary* package ‘abjData’ ...
* DONE (abjData)

The downloaded source packages are in
‘/tmp/RtmpDpbnfm/downloaded_packages’"""


library(abjData)
assuntos



## ЗАДАНИЕ 2.
## Создайте вектор, значениями которого будут названия колонок таблицы assuntos из предыдущего задания
table <-assuntos
column_table_names <-c(colnames(table))
column_table_names
class(column_table_names)

## ЗАДАНИЕ 3.
## Создайте три переменные, каждая из которых будет содержать цифру 1: первая – в виде целого числа,

## вторая – в виде текстового символа, третья – в виде логического выражения. Для решения задания 
## используйте функции конверсии типов данных.

one <- as.integer(1)
two <- as.character(one)
three <- as.logical(one)

one
two
three


## ЗАДАНИЕ 4. 
## «Вкучные мячные пирожки, шышлык, капучта и агурцы солёные. Из питья квас да компот, а захотите пива– покажите пачпорт».
## Запишите эту строку в переменную, после чего отредактируйте, исправив все 
## грамматические ошибки. Добавьте комментарии для каждого этапа работы.

v <- c("Вкучные мячные пирожки, шышлык, капучта и агурцы солёные. Из питья квас да компот, а захотите пива– покажите пачпорт")
v

##Все буквы ч ошибочные, поэтому их можно заменить на с
v1 <- gsub("ч", "с", v)
v1
##"Вкусные мясные пирожки, шышлык, капуста и агурцы солёные. Из питья квас да компот, а захотите пива– покажите паспорт"
v1 <- sub("шы", "ша", v1)
v1

v1 <- sub('аг', "ог", v1)
v1

## ЗАДАНИЕ 5. 
## Создайте вектор, состоящий из следующих английских букв: a, i, l, n, u.
## С помощью известных вам функций создайте вектор с порядковыми номерами этих букв в английском алфавите.

v1 <- c('a', "i", "l", "n", "u")
v2 <- letters
v2
v1[5]

match(v1[1], v2)
a_position <- match(v1[1], v2)
i_position <- match(v1[2], v2)
l_position <- match(v1[3], v2)
n_position <- match(v1[4], v2)
u_position <- match(v1[5], v2)

v_positions <- c(a_position, i_position, l_position, n_position, u_position)
v_positions



## ЗАДАНИЕ 6. 
## Создайте таблицу (датафрейм), в которой первой колонкой будет вектор из 12 случайных целых чисел 
## от 1 до 100, а второй колонкой – вектор логических значений, показывающих, делится ли соответствующее
## число на 3 без остатка. Название для колонок придумайте самостоятельно.

integers <- sample(1:100, 12)
integers

integers_division_by_3 <- c(first_column_randint %% 3 == 0 )
integers_division_by_3

df <- data.frame(integers, integers_division_by_3)
df


## ЗАДАНИЕ 7.
## Создайте у себя на диске D с помощью скрипта на языке R папку reflection, а внутри неё – папку echo. 
## Сделайте папку  echo рабочей.

# создание папки reflection
dir.create("/home/sas/reflection")
# создание папки echo
dir.create("/home/sas/reflection/echo")
paths <-"/home/sas/reflection/echo"
setwd(paths)
getwd


## ЗАДАНИЕ 8.
## Невиданная щедрость! Для выполнения следующего задания мы вам дарим готовый вектор!
## Откройте podarok и посмотрите, что внутри
podarok <- c("\U0001f60d", "\U0001f631", "\U0001f60a", "\U0001f61b")
podarok

phrases <- c("Я люблю R", "Ваши задания пугают меня", "Я молодец", "Доделаю все дома" )
phrases

meme <- paste(podarok, phrases)
meme2 <- matrix(meme, 2, 2)
meme2
## Создайте матрицу как на картинке, объединив элементы подаренного вам вектора с нужными фразами


## ЗАДАНИЕ 9.
## Создайте вектор со следующими именами: 
## Abraham, Ashley, Jonatan, Jorgen, Linda, Sandy, Vincent, Wilhelmina, Wolfgang.
## Создайте таблицу с одной колонкой под названием Names, в которой будут эти имена.
## Добавьте в эту таблицу новую колонку Number_of_Letters, значениями для которой будет количество букв
## в каждом соответствующем имени.
## Для решения данной задачи вам понадобиться самостоятельно разобраться с тем, как работает функция 
## length ()

Names <- c("Abraham", "Ashley", "Jonatan", "Jorgen", "Linda", "Sandy", "Vincent", "Wilhelmina", "Wolfgang" )
Names
df_names = data.frame(Names)
df_names
Number_of_Letters <- c(nchar(Names))
Number_of_Letters
df2 <- cbind(df_names, Number_of_Letters)
df2


