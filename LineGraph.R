# -- Line Graph (Çizgi Grafiði) --


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Line grafikler scatterplot grafikleri gibi kartezyen kordinatlarda ifade edilir.
# Ancak scatterplotta olduðu gibi baðýmsýz noklarla deðil, noktalarýn birleþmiþ halinin oluþturduðu
# bir çizgi þeklinde görselleþtirilir.


# Line Graph örnekleri için "EuStockMarkets" dataseti kullanýlabilir.
# Bu dataset hakkýnda bilgi almak için  "?EuStockMarkets" yazýlabilir.
?EuStockMarkets


# Yukarýdaki komut yazýldýðýnda "mts" ifadesi bu datasetin matris olduðunu gösterir.
# ggplot2 matris formatý ile çalýþmadýðýndan bu dataset üzerinde düzenleme yapýlmasý gerekir.


# Bu durumu deðiþtirmek için aþaðýdaki komut kullanýlabilir;
EuStockDF <- as.data.frame(EuStockMarkets)


# head() komutu ile datasetin ilk 6 satýrý incelenebilir. 
head(EuStockDF)


# Bir LineGraph çizmek istersek;
# X eksenindeki deðer için; 1 'den oluþturduðumuz "EuStockDF" dataframe 'in satýr sayýsý kadar yazabiliriz.
# Böylece; mevcut olan data sayýsýna göre göre "DAX" deðerini Y-ekseninde çizdirebiliriz. (Stok sayýsý)
ggplot(EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX)) + geom_line()


# Çizginin kalýnlýðýný deðiþtirmek için geom_line(size=) kullanýlabilir.
# Açýklayýcý olmasý için X eksenine "Stocks" etiketini vermek istersek;
ggplot(EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX)) + geom_line(size=1.5) + labs(x = "Stocks")


# 1 ekran üzerine 1 'den fazla LineGraph ekleyebiliriz; 
dax_smi_plot <- ggplot() +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX), size = 1.5, colour="light blue") +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = SMI), size = 1.5, colour = "red") +
  labs(x = "Time", y = "Stocks")
print(dax_smi_plot)


# Bütün stoklarý çizmek istersek; 
all_stocks <- ggplot() +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX), size=1, colour="light blue") +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = SMI), size =1, colour = "red") + 
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = CAC), size =1, colour = "purple") + 
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = FTSE), size =1, colour = "green") +
  labs(x = "Time", y = "Stocks")
print(all_stocks)


# Grafiðe isim eklersek;
legend_stocks <- all_stocks + xlab("Days") + ylab("Price") + ggtitle("Eu Stocks")
print(legend_stocks)
