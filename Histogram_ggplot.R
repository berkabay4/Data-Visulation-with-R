# -- Histograms --


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Histogramlar, veri sayýsýnýn grafiksel gösterimi olarak tanýmlanabilir. 
# Histogram, Nicel(Quantitative) bir verinin daðýlýmýný gösterir. 
qplot(mtcars$hp, geom="histogram") # "mtcars" içerisinde hp(horse power) deðeri için qplot ile basit histogram oluþturalým.


# Yukarýdaki kod bloðunu çalýþtýrdýðýmýzda band geniþliði belirlenmediði için hata verecektir. 
# Band geniþliðini 25 yaparak tekrar denersek;
qplot(mtcars$hp, geom="histogram", binwidth = 25)


# Band geniþliðini deðiþtirdikten sonra bazý deðerleri görselde birbirlerine çok yakýn olduklarý için göremiyoruz.
# Bunu engellemek için dýþ çerçeve rengini deðiþtirirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"))


# Eksenlere baþlangýç ve bitiþ deðeri tanýmlayabiliriz. Örneðin X ekseninde 50 - 350 arasýný çizdirmek istersek; 
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"),xlim=c(50,350))


# Az önce bir hata aldýðýmýz gibi, eksenleri sýnýrlarken herhangi bir deðeri silersek R hata verecektir. Örneðin;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"),xlim=c(80,200))


# Grafiði eski haline döndürüp x ve y eksenlerini isimlendirirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars")


# Alpha parametresini "0" olarak girerek histogram içerisindeki rengi transparan yapabiliriz.
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0))


# Histograma grafiðine genel bir isim verirsek;
qplot(mtcars$hp, geom="histogram", binwidth = 25, colour = I("black"), xlab = "Horsepower", ylab= "Number of Cars", alpha = I(0),
      main = "Histogram")