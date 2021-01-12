# -- Basic Plot --
count <- table(mtcars$cyl)
barplot(count)


# --ggplot2--


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)



# --qplot()--
qplot(mtcars$cyl, geom = "bar")



# ggplot2 2 adet farklý fonksiyona sahip. Bunlar;

# 1) qplot()  -> Limitli düzenleme imkaný ile plot() fonksiyonundan görsel olarak daha esnek çizimler için.
# 2) ggplot() -> Esnek düzenleme imkaný sunan çizim fonksiyonu. 
ggplot(data= mtcars, aes(mtcars$hp))  + 
        geom_histogram(breaks=seq(40, 350, by = 25),  
                 colour = I("black"),
                 aes(fill=..count..))


# -- Qualitative (Nitel) vs Quantitative(Nicel) Data --


# *Genel olarak verileri nitel ve nicel veriler olarak 2 'ye ayýrabiliriz. Qualitative Data (Niteliksel Veri) katagorik veriler
# olarakta adlandýrýlabilir. Quantitative Data (Niceliksel Veri) Sayýsal veriler olarak adlandýrýlabilir.


# Kategorik Veri & Quantative Data -> Bunlar adýndan anlaþýlacaðý gibi katagorilere atýfta bulunan verilerdir.
#                                     Evet/Hayýr sorularýna iliþkin cevap içerebilir, bir kiþinin en sevdiði
#                                     dondurma aromasý, bir yerin ismi vb. " Onun sevdiði aroma çilek mi ? " gibi.


# Sayýsal Veri & Quantitative Data -> Sayýlsal veriler bir tür ölçüm sonucudur, basit matematik modelleri ile manipüle edilebilir.


# * Her veri türü için en iyi çizim yöntemleri ya da grafik çeþidi farklýdýr. 


mtcars        # "mtcars" datasetini incelemek için, " ?mtcars " komutu ile daha fazla bilgi alýnabilir. 

head(mtcars)  # "mtcars" datasetinin ilk 6 satýrýný görmek için

tail(mtcars)  # "mtcars" datasetinin son 6 satýrýný görmek için

summary(mtcars) # "mtcars" içerisindeki verilerin hýzlýca ortalama deðer, max, min vb. özelliklerini görmek için.


# -- Bar Plots -- 


# ?qplot ile fonksiyon hakkýnda detaylý bilgiye ulaþýlabilir.


#colour ile çerçeve rengi, fill ile içerideki renk deðiþtirilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("black"), colour = I("blue"))  


# ggplot2 'de Renk kodlarý için = http://sape.inf.usi.ch/quick-reference/ggplot2/colour


# xlab, ve ylab ile eksenlere isim verilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles")


# main ile grafiðe genel isim verilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles", main = "Cylinders in mtcars")



