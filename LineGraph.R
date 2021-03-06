# -- Line Graph (�izgi Grafi�i) --


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Line grafikler scatterplot grafikleri gibi kartezyen kordinatlarda ifade edilir.
# Ancak scatterplotta oldu�u gibi ba��ms�z noklarla de�il, noktalar�n birle�mi� halinin olu�turdu�u
# bir �izgi �eklinde g�rselle�tirilir.


# Line Graph �rnekleri i�in "EuStockMarkets" dataseti kullan�labilir.
# Bu dataset hakk�nda bilgi almak i�in  "?EuStockMarkets" yaz�labilir.
?EuStockMarkets


# Yukar�daki komut yaz�ld���nda "mts" ifadesi bu datasetin matris oldu�unu g�sterir.
# ggplot2 matris format� ile �al��mad���ndan bu dataset �zerinde d�zenleme yap�lmas� gerekir.


# Bu durumu de�i�tirmek i�in a�a��daki komut kullan�labilir;
EuStockDF <- as.data.frame(EuStockMarkets)


# head() komutu ile datasetin ilk 6 sat�r� incelenebilir. 
head(EuStockDF)


# Bir LineGraph �izmek istersek;
# X eksenindeki de�er i�in; 1 'den olu�turdu�umuz "EuStockDF" dataframe 'in sat�r say�s� kadar yazabiliriz.
# B�ylece; mevcut olan data say�s�na g�re g�re "DAX" de�erini Y-ekseninde �izdirebiliriz. (Stok say�s�)
ggplot(EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX)) + geom_line()


# �izginin kal�nl���n� de�i�tirmek i�in geom_line(size=) kullan�labilir.
# A��klay�c� olmas� i�in X eksenine "Stocks" etiketini vermek istersek;
ggplot(EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX)) + geom_line(size=1.5) + labs(x = "Stocks")


# 1 ekran �zerine 1 'den fazla LineGraph ekleyebiliriz; 
dax_smi_plot <- ggplot() +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX), size = 1.5, colour="light blue") +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = SMI), size = 1.5, colour = "red") +
  labs(x = "Time", y = "Stocks")
print(dax_smi_plot)


# B�t�n stoklar� �izmek istersek; 
all_stocks <- ggplot() +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = DAX), size=1, colour="light blue") +
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = SMI), size =1, colour = "red") + 
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = CAC), size =1, colour = "purple") + 
  geom_line(data = EuStockDF,aes(x=c(1:nrow(EuStockDF)), y = FTSE), size =1, colour = "green") +
  labs(x = "Time", y = "Stocks")
print(all_stocks)


# Grafi�e isim eklersek;
legend_stocks <- all_stocks + xlab("Days") + ylab("Price") + ggtitle("Eu Stocks")
print(legend_stocks)
