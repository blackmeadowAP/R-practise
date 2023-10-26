vec <- vector(mode = "character", length = 5)
v2 <- c(1:7)

vec <- c()
vec[1:3] <- v2[3:5]
vec

vecemp<- vector(mode = "character", length = 5)
vecemp[1:3] <- v2[3:5]
vecemp

seq(from = 5, to = 7, by = 0.2)


xy <- sample(x = LETTERS, size = 12, replace=FALSE)

xy

samp <- c(rep("Python", 3), rep('Monkey', 5), rep('Parrot', 38))

samp
samp2 <- "Foo Fighters"
samp3 <- c(samp, samp2)
samp3


## Сравните результаты выплнения кода ниже, чтобы осознать разницу

matrix(data = c(1:6), nrow = 2, ncol = 3, byrow = TRUE)
matrix(data = c(1:6), nrow = 2, ncol = 3, byrow = FALSE)


## Создадим переменную в которую запишем матрицу
m <- matrix(data = c(1:6), nrow = 2, ncol = 3, byrow = FALSE)
## Чтобы увидеть внутреннюю структуру объекта, используйте функцию str()
str(m)


#### УПРАЖНЕНИЕ 2
#### Запишите в качестве матрицы вектор с удавами, мартышками и попугаями. Обратите внимание
#### на предупреждения (если они у вас появятся). Как нужно записывать данные в матрицу, чтобы их не было?
mat_monkeys <- matrix(samp, ncol = 2, byrow =FALSE)
mat_monkeys


#### Следующий класс объектов - Таблица.
#### Таблица (data frame). Обычно её строки соответствуют наблюдениям, колонки - параметрам
#### наблюдения. Каждая колонка – вектор. В таблице могут быть колонки РАЗНОГО типа.
#### Давайте посмотрим, как это выглядит на примере данных, собранных в 19 веке британским учёным 
#### Фрэнсисом Гальтоном, который изучал взаимосвязь между ростом родителей и их детей. 

install.packages("HistData")

library(HistData)

df <- GaltonFamilies
df

##УПРАЖНЕНИЕ 3.
## 1) Создадим новую таблицу на основе таблицы GaltonFamilies. Давайте добавим 
## в неё информацию о весе родителей, а также о том, имеют ли они
## наследственные заболевания. Масса тела родителей в данном случае будет случайной
## величиной из диапазона 45 и 90 кг, а наличие заболеваний - случайным фактором
## Healthy или Diseased. Создайте вектора нужной длины при помощи функции sample(). 
## Запишите в переменную dfr новую таблицу, в которую будут добавлены колонки Parents_Weight с весом
## и колонка Health - для указания статуса здоровья.
dims <- dim(df)
dims[1]
fathers_weights <-data.frame("Father weights" =  sample(45:90, dims[1], replace=TRUE))
fathers_weights

mother_weights <-data.frame("Mother weights" =  sample(45:90, dims[1], replace=TRUE))
mother_weights

dims[1]

what <- data.frame( Health = sample(c("Healthy", "Diseased"), 
                                      dims[1], replace = TRUE))
new_df <- cbind(df, fathers_weights, mother_weights, what)
new_df


## УПРАЖНЕНИЕ 4.
## Создайте лист при помощи функции list() по аналогии с функцией data.frame(). Включите в его состав
## вектор с животными, матрицу и таблицу из прошлых заданий. Изучите струкруру этого объекта 
## при помощи str()


# Создание вектора и матрицы из предыдущих заданий
animals <- c("cat", "dog", "elephant")
animals
matrix_data <- matrix(1:9, nrow = 3, ncol = 3)
matrix_data

# Создание листа
my_list <- list(animals = animals, matrix_data = matrix_data)
my_list
# Изучение структуры листа
str(my_list)

## Атрибуты - метаданные, описывающие структуру объекта. Используйте names(), чтобы добавлить имена
## к вектору
v1 <- LETTERS
v1
names(v1)
names(v1) <- c("FirstName", "LastName")
names(v1) #обратите внимание на NA

##УПРАЖНЕНИЕ 5
## Изучите colnames() и rownames() для таблицы dfr, измените имена колонок с помощью этих функций
## КОНЕЦ УПРАЖНЕНИЯ
v_colnames <- colnames(df)
v_colnames
new_colnames <- sample(1:8)
new_colnames
colnames(df) <- new_colnames
colnames(df)
rownames(df)
df











