getwd()
#установить рабочую папку на ту, где содержится код функции, файлы датасета
setwd("/home/sas/R smrad/")
source("pollutantmean.R")
source("id_generator.R")

#задание констант, необходимых для работы импортируемой функции
#задание рабочей папки, откуда будет извлекаться датасет
directory <- "/home/sas/R smrad/specdata"
pollutant <- "sulfate"

#проверка работы функции
id <-"001"
a <- pollutantmean(directory, pollutant, id)
a

# Создание пустого списка

n <- 50
string_list <- id_generator(n)
# Вывод списка
print(string_list)
string_list[200]

#создание пустого списка, в который будут записываться вычисленные функцией 
#значения mean каждого файла
means_list <- list()


#расчет списка, содержащего средние значения указанного загрязнителя 
#каждую итерацию цикла обрабатывается файл с id в виде трехзначного кода
for (i in 1:n) {
  result <- pollutantmean(directory, pollutant, string_list[i])
  means <- paste0(result)
  means_list <- c(means_list, means)
  
}

#вызов элементов из списка
means_list[1:49]

