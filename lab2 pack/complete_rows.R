#Запрограммируйте функ-
# цию, которая считывает указанные в вашем варианте файлы и возвращает
#количество наблюдений, не содержащих пропущенные значения, для каж-
# дого из файлов. Функция должна вернуть объект типа Data Frame, в кото-
# ром первая колонка – имя файла ('id'), вторая колонка ('nobs') – количество
#наблюдений, не содержащих пропущенные значения в данном файле.

getwd()
#установить рабочую папку на ту, где содержится код функции, файлы датасета
setwd("/home/sas/R smrad/")
source("id_generator.R")
directory <- "/home/sas/R smrad/specdata"
n <- 50
string_list <- id_generator(n)
pollutant <- "sulfate"

test <- function(){
complete <- function(directory, string_list, pollutant1, n){
  vs_notna <-list()
  csv_format <- ".csv"
  setwd(directory)
  for (i in 1:n){
    table_name <- paste0(string_list[i], csv_format)
    data_csv <- read.csv(table_name)
    data_cleaned <- subset(data_csv, select = pollutant)
    data_cleaned <- data_cleaned[!is.na(data_cleaned)]
    result_notna <- length(data_cleaned)
  #return(result_notna)
  #return(nitrate_data_cleaned)
    
    notna <- paste(result_notna)
    vs_notna <- c(vs_notna, notna)}
  return(vs_notna)
  
}

#c = complete(directory, string_list[40] )
#print(c)

sulfate_quantity <- complete(directory, string_list, pollutant, n)
pollutant <- "nitrate"
nitrate_quantity <- complete(directory, string_list, pollutant, n)

sulfate_quantity <-unlist(sulfate_quantity)
sulfate_quantity

nitrate_quantity <-unlist(nitrate_quantity)
nitrate_quantity

nobs <- as.integer(sulfate_quantity) + as.integer(nitrate_quantity)

string_list <- unlist(string_list)
string_list

summary <- data.frame(ID = string_list, Nobs = nobs, Sulfate = sulfate_quantity,
                      Nitrate = nitrate_quantity)

return(summary)
}

c <- test()
c
  

