getwd()
setwd("/home/sas/R smrad")
getwd()

#Задание 1. Выполните произвольные вычисления в командном окне, по-
#пробуйте использовать различные арифметические операции и задайте с
#помощью круглых скобок приоритет их выполнения.

a <- ((pi*(5**2)) - (pi*(4**2)) + 5)
print(a)

#Задание 5. Введите в test_matrix.r описанные выше процедуры объяв-
#ления вектора и матрицы, процедуры доступа к элементам вектора и мат-
#  рицы, поиск минимального и максимального элемента в матрице. Просмот-
#  рите результат в командном окне.
#Добавьте в test_matrix.r код, добавляющий и удаляющий вектор к мат-
#  рице.

#объявление вектора и матрицы
vector <-c(1, 2, 3, 4)
vector

test_matrix <-matrix(LETTERS, nrow = 3, ncol = 5)
test_matrix

#процедуры доступа к элементам вектора и матрицы
vector[1]
vector[4]

test_matrix
test_matrix[1]
test_matrix[1, 2]

#поиск минимального и максимального элемента в матрице
number_matrix <- matrix(1:15, nrow = 3, ncol = 5)
number_matrix
#поиск минимальной колонки
min_matrix <- apply(number_matrix,1,  min)
min_matrix

#макс значение в матрице
max(number_matrix)

#поиск минимальной строки
min_matrix <- apply(number_matrix,2,  min)
min_matrix

#мин значение в матрице
min(number_matrix)

#поиск макс колонки
number_matrix
max_matrix <- apply(number_matrix,1,  max)
max_matrix

#поиск макс строки
max_matrix <- apply(number_matrix,2,  max)
max_matrix

#Добавьте в test_matrix.r код, добавляющий и удаляющий вектор к матрице

added <- c(55, 56, 57)

new_matrix <- cbind(number_matrix, added)

new_matrix[, -6]

#Объявите матрицу C размерности 5 строк на 5 столбцов с
#произвольными элементами. С помощью функций min, max найдите мини-
#мальные и максимальные элементы по строкам, по столбцам и по всей мат-
# рице

fifty_five <- matrix(1:25, nrow = 5, ncol = 5)
fifty_five

min_str <- apply(fifty_five,1, min)
min_str

min_row <- apply(fifty_five, 2, min)
min_row

min(fifty_five)

max_str <- apply(fifty_five, 1, max)
max_str

max_row <- apply(fifty_five, 2, max)
max_row

max(fifty_five)




A <- array(0,dim = c(2,3,4))
A

"""
Получить решение x заданной системы линейных уравнений
вида A* x = B, где A – квадратная матрица n  n, B – вектор размерности n.
Решение данной системы уравнений можно получить, набрав строку кода
"""
#Решите уравнение A*x = B, A=[2 1; 3 4] и B=[4; 11].
A <- matrix(c(2, 1, 3, 4), 2, 2)
A 

B <- c(4, 11)
B 

x <- solve(A, B)
x




