my_func <- function(left, right, N){
  # Генерация N значений случайной величины X в области задания X
  runif(n = N, min = left, max = right)
}

# Задание диапазона изменения X
X_left <- -2
X_right <- 2
# Задание диапазона изменения Y
Y_left <- -3
Y_right <- 3
N <- 1000 # Задание количества сгенерированных точек
source("myfunc.R") # Вызов функции

X <- my_func(X_left, X_right, N)
Y <- my_func(Y_left, Y_right, N)
plot(X,Y) # Построение графика функции







