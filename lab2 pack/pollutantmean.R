#апрограммируйте функ-
#цию pollutantmean, которая должна вычислить среднее значение уровня за-
#  грязнения сульфатами или нитратами для заданного количества источников
#(задается номерами файлов). Аргументы функции pollutantmean: directory –
#путь и название папки с данными; pollutant – тип загрязнителя ("sulfate" или
# "nitrate") и id – вектор цифровых значений источников данных. Принимая
#на входе список аргументов, функция pollutantmean считывает данные о за-
# данном загрязнителе от указанных источников (из папки 'directory'), вычис-
#ляет среднее значение по всем наблюдениями, игнорируя пропущенные
#значения, и возвращает вычисленное среднее значение.

pollutantmean <- function(directory, pollutant, id) {
  main_wd <- getwd()
  setwd(directory)
  csv_format <- ".csv"
  table_name <- paste0(id, csv_format)
  print(table_name)
  data_csv <- read.csv(table_name)
  wd_data_cleaned <- subset(data_csv, select = pollutant)
  wd_data_cleaned <- wd_data_cleaned[,1]
  wd_data_cleaned_full <- wd_data_cleaned[!is.na(wd_data_cleaned)]
  wd_data_cleaned_full
  means <- mean(wd_data_cleaned_full)
  return(means)
  
}


