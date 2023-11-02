# Цикл для создания строк
id_generator <- function(n) {
  string_list <- list()
  for (i in 1:200) {
    # Форматирование числа с трехзначным номером
    number <- sprintf("%03d", i)
    
    # Создание строки и добавление в список
    string <- paste0(number)
    string_list <- c(string_list, string)
  }
  return(string_list)
}