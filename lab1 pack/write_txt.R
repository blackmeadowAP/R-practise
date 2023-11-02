#Запись данных в файл с помощью функции write.table
#Создайте новый r-файл с именем write_txt, в котором набе-
#рите код записи данных с помощью функции write.table. Запустите код на
#выполнение.

getwd()
x <- seq(from=0,to=5,by=0.1)
y <- 2*x^2 + x - 1
M <- cbind(x,y)
write.table(M,"MyFile.txt")

