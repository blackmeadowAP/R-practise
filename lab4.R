#Разработать алгоритм метода главных компонент и программно реа-
#лизовать его в среде R.
#3. Выполнить анализ экспериментальных данных методом главных ком-
 # понент.
# Загрузить данные согласно вашему варианту (табл. 4.2).
# Нормировать (стандартизировать) исходные экспериментальные
#данные. Построить корреляционную матрицу.
# Удостоверится, что корреляционная матрица значимо отличается
#от единичной матрицы.
# Рассчитать проекции объектов на главные компоненты.
#4. Произвести анализ результатов работы метода главных компонент.
# Проверить равенство сумм выборочных дисперсий исходных при-
#  знаков и выборочных дисперсий проекций объектов на главные компо-
#  ненты.
# Определить относительную долю разброса, приходящуюся на глав-
#  ные компоненты. Построить матрицу ковариации для проекций объектов
#на главные компоненты.

#matrix creates a matrix from the given set of values.
#as.matrix attempts to turn its argument into a matrix.
#help(as.matrix)

#Retrieve or set the dimension of an object.
#help(dim)

#return means of rows or columns
#help(colMeans)

#Функция apply в R позволяет применять заданную функцию к указанному массиву или структуре данных по определенной оси (строки или столбцы). Она имеет следующий синтаксис:

#apply(X, MARGIN, FUN, ...)

#Где:
#- X: массив или структура данных, к которому нужно применить функцию
#- MARGIN: ось, по которой нужно применить функцию (1 - по строкам, 2 - по столбцам). Может принимать дополнительные значения (0 - применить функцию ко всем элементам, c(1,2) - применить функцию к каждому элементу)
#- FUN: функция, которая будет применяться к элементам массива или структуры данных
#- ...: дополнительные аргументы, необходимые для функции FUN

#Функция apply возвращает результаты применения функции FUN к указанному массиву или структуре данных в виде массива или структуры данных соответствующей размерности. Таким образом, функция apply позволяет выполнять операции, которые требуют итерации по элементам исходного массива или структуры данных.


#help(apply)



#Return standart deviation
#help(sd)

#transpose matrix or dataframe
#help(t)

#print valuse
#help(print)

#return sum of vector elements
#help(sum)

#return result of chi squared distribution
#help(qchisq)

#the eigen() function is used to calculate eigenvalues and eigenvectors of a 
#square matrix. It takes a matrix as input and returns 
#a list of eigenvalues and eigenvectors.

#help(eigen)

#matrix multiplication
#%*%

#return dispersion of vector and mean
#help(var)


#САМА ПРОГРАММА



main_komponents <- function(path, filename){

getwd()
setwd(path)
getwd()
#data
#normalized_data
# Загрузка данных
data <- read.table(filename, header = TRUE)
#data

# Нормирование данных
normalized_data <- scale(data)
#normalized_data

# Построение корреляционной матрицы
cor_matrix <- cor(normalized_data)
#print("Корреляционная матрица: ")
#print(cor_matrix)

#вычисление размеров матрицы
dim_of_cor_matrix <- dim(cor_matrix)
#dim_of_cor_matrix[1]
print(paste("Размеры матрицы", dim_of_cor_matrix))

#создание единичной матрицы для сравнения с корреляционной матрицей
test_matrix <- diag(dim_of_cor_matrix[1])
#test_matrix

# Проверка отличия корреляционной матрицы от единичной
if (!identical(cor_matrix, test_matrix)) {
  print("Корреляционная матрица значимо отличается от единичной матрицы")
} else { print("Корреляционная матрица НЕ отличается от единичной матрицы")}

# Расчет собственных значений и собственных векторов
eigen_values <- eigen(cor_matrix)$values
eigen_vectors <- eigen(cor_matrix)$vectors
eigen_values
eigen_vectors

# Количество главных компонент, для которых производится анализ
M <- 2
print(paste("Значение главных компонент М: ", M ))

# Выбор первых M главных компонент
selected_components <- eigen_vectors[, 1:M]
#selected_components

# Расчет проекций объектов на главные компоненты
projected_data <- normalized_data %*% selected_components
print(projected_data)
#print("Значение проекций объектов на главные компоненты:")
#print(projected_data)

# Расчет выборочных дисперсий исходных признаков
original_variances <- apply(normalized_data, 2, var)
#original_variances
#print("Значение выборочных дисперсий исходных признаков")
#print(original_variances)

# Расчет выборочных дисперсий проекций на главные компоненты
projected_variances <- apply(projected_data, 2, var)
#projected_variances
print("Значение выборочных дисперсий проекций на главные компоненты")
print(projected_variances)

# Проверка равенства сумм выборочных дисперсий
if (sum(original_variances) == sum(projected_variances)) {
  print("Суммы выборочных дисперсий равны")
} else {print(" Суммы выборочных дисперсий НЕ РАВНЫ")}

# Расчет относительной доли разброса, приходящейся на главные компоненты
explained_variance <- eigen_values[1:M] / sum(eigen_values)
#explained_variance
print("Значение относительной доли разброса, приходящейся на главные компоненты")
print(explained_variance)

# Построение матрицы ковариации для проекций объектов на главные компоненты
cov_matrix <- cov(projected_data)
#cov_matrix
#print("Матрица ковариации для проекций объектов на главные компоненты" ) 
#print(cov_matrix)
# Построение диаграммы рассеяния на основе первых M главных компонент
#plot(projected_data[,1], col=projected_data[,2], type = "p", pch = 16)
print(projected_data)
plot(projected_data[,1], projected_data[,2], type = "p", pch = 16)

pca <- princomp(normalized_data, cor = TRUE)
scores <- pca$scores
cluster_labels <- kmeans(normalized_data, centers = 3)$cluster
plot(scores[, 1], scores[, 2], col = cluster_labels, pch = 16)

}

#path <- "/home/sas/R smrad/data for 4 lab"
#setwd(path)
#filename <- "data2.txt"
#main_komponents(path, filename)
