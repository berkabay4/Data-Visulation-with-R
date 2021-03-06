# -- Histograms --


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Histogramlar, veri say�s�n�n grafiksel g�sterimi olarak tan�mlanabilir. 
# Histogram, Nicel(Quantitative) bir verinin da��l�m�n� g�sterir. 
qplot(mtcars$hp, geom="histogram") # "mtcars" i�erisinde hp(horse power) de�eri i�in qplot ile basit histogram olu�tural�m.


# Yukar�daki kod blo�unu �al��t�rd���m�zda band geni�li�i belirlenmedi�i i�in hata verecektir. 
# Band geni�li�ini 25 yaparak tekrar denersek;
qplot(mtcars$hp, geom="histogram", binwidth = 25)


# Band geni�li�ini de�i�tirdikten sonra baz� de�erleri g�rselde birbirlerine �ok yak�n olduklar� i�in g�remiyoruz.
# Bunu engellemek i�in d�� �er�eve rengini de�i�tirirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"))


# Eksenlere ba�lang�� ve biti� de�eri tan�mlayabiliriz. �rne�in X ekseninde 50 - 350 aras�n� �izdirmek istersek; 
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"),xlim=c(50,350))


# Az �nce bir hata ald���m�z gibi, eksenleri s�n�rlarken herhangi bir de�eri silersek R hata verecektir. �rne�in;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"),xlim=c(80,200))


# Grafi�i eski haline d�nd�r�p x ve y eksenlerini isimlendirirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars")


# Alpha parametresini "0" olarak girerek histogram i�erisindeki rengi transparan yapabiliriz.
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0))


# Histograma grafi�ine genel bir isim verirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0),
      main = "Histogram")