# 1.1 Загрузка файла по строкам - функция readLines()

#setwd("E:/Документы/Работа/Методические материалы по дисциплинам/Программирование на R/Практики - ВВ/Лабораторное занятие № 4-20221018")
setwd("/home/sas/Documents/practice r")
getwd()
readLines("synapse.txt")

readLines("bison_data.csv")
read.csv("bison_data.csv")
is.data.frame(read.csv("bison_data.csv"))

# 1.2
readLines("bison_data.txt")
is.character(readLines("bison_data.txt"))


read.table("bison_data.txt")
read.table("bison_data.txt", header = TRUE)
names(read.table("bison_data.txt"))
names(read.table("bison_data.txt", header = TRUE))

# 1.3 Продолжим работать с загрузкой таблиц
read.table("iris_data_2.txt", header = TRUE)
read.table("iris_data_2.txt", header = TRUE, sep = "+")

df <- read.table("iris_data_2.txt", header = TRUE, sep = "+")
str(df)

df <- read.table("iris_data_2.txt", header = TRUE, sep = "+", dec = ",", as.is = FALSE)
str(df)

### 2.1. Векторы.

val <- c("a", "b", "c", "d", "e", "f")
val[5]

val[-1]
val[-2]

val[length(val)]
val[length(val)-2]
val[val > "c"]

v <- val > "c"
v

val[v]

val[val %in% c("a", "e")]


names(val) <- LETTERS[1:6]
val
val["A"]
val[c("A", "D")]


### 2.2. Как получить доступ к данным в объектах различного типа? Матрицы.
x <- matrix(data=1:6, nrow=2, ncol=3)
x


df[df$Species == "setosa",]

subset(df, subset = (Species == "setosa"), select = c(Sepal.Length, Sepal.Width))

#### Используйте функцию subset, чтобы отобрать из объекта df в объект df2 строки,
#### содержащие описание ирисов virginica с параметром Sepal.Length 6.5 и выше.
#### Запишите в переменную df3 колонки Petal.Length, Petal.Width и Species для ирисов, 
#### относящихся к виду virginica или имеющих Petall.Width меньше единицы.
getwd()
setwd("/home/sas/Documents/practice r")
getwd()

df <- read.table("iris_data_2.txt", header = TRUE, sep = "+")
df

df2 <- subset(df, Species == "virginica" & Sepal.Length >= 6.5)
df2

df3 <- subset(df, Species == "virginica" | Petal.Width < 1)
df3



#### Вы можете использовать функции rbind() и cbind(), чтобы комбинировать несколько таблиц вместе
#### и увеличивать в них количество строк (rbind(), таблицы "ставятся друг на друга") 
#### либо столбцов (cbind(), таблицы "ставятся рядом друг с другом"). 

#### а. Используйте rbind(), чтобы создать таблицу combi1, содержащую общие для df2 и df3 колонки. 

#### б. Создайте таблицу combi2,  содержащую первые 20 строк таблицы df3 и первые 20 строк из 
#### первых двух колонок df2 (именно в таком порядке).
head(df3, 20)

combi1 <- rbind(df2, df3)
combi1

subset_df2 <- df2[, 1:2]
subset_df2

combi2 <- data.frame(head(df3, 20), subset_df2[1:20, ])
combi2

#### в. Выполните следующий код:
df_cbind <- cbind(df2[1:20,], df2[21:40,])
df_cbind
#### Объясните, почему в колонки были добавлены NA.

#### 3) Описание и аннотирование данных в таблице
comment(df) <- "Dataset, created by Ronald Fisher. Content: Iris sepals and petals parameters"
cat(comment(df))
str(df)

#### comment() является частным случаем использования функции attr(). добавим с её помощью комментарии
#### для отдельных колонок.
attr(x = df$Sepal.Length, which = "comment") <- "Column with length of sepals"
str(df)

#### Добавление баннера
install.packages("bannerCommenter")
library(bannerCommenter)


####Отберите 20 любых строк из таблицы df вобъект renames. Измените в нём имена колонок
####на
####произвольные строки текста, а имена
####строк - на случайные буквы из встроенноговектора LETTERS (функция sample()).

renames <- df[sample(nrow(df), 20), ]
renames

col_names <- c("First", "Second", "Third", "Fourth")
col_names
row_names <- sample(LETTERS, 20)

colnames(renames) <- col_names
rownames(renames) <- row_names

renames

write.table(x = renames, file = "renames.txt")
getwd()
test <- read.table("renames.txt")
test

