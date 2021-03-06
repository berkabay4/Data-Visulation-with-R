# -- Basic Plot --
count <- table(mtcars$cyl)
barplot(count)


# --ggplot2--


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)



# --qplot()--
qplot(mtcars$cyl, geom = "bar")



# ggplot2 2 adet farkl� fonksiyona sahip. Bunlar;

# 1) qplot()  -> Limitli d�zenleme imkan� ile plot() fonksiyonundan g�rsel olarak daha esnek �izimler i�in.
# 2) ggplot() -> Esnek d�zenleme imkan� sunan �izim fonksiyonu. 
ggplot(data= mtcars, aes(mtcars$hp))  + 
        geom_histogram(breaks=seq(40, 350, by = 25),  
                 colour = I("black"),
                 aes(fill=..count..))


# -- Qualitative (Nitel) vs Quantitative(Nicel) Data --


# *Genel olarak verileri nitel ve nicel veriler olarak 2 'ye ay�rabiliriz. Qualitative Data (Niteliksel Veri) katagorik veriler
# olarakta adland�r�labilir. Quantitative Data (Niceliksel Veri) Say�sal veriler olarak adland�r�labilir.


# Kategorik Veri & Quantative Data -> Bunlar ad�ndan anla��laca�� gibi katagorilere at�fta bulunan verilerdir.
#                                     Evet/Hay�r sorular�na ili�kin cevap i�erebilir, bir ki�inin en sevdi�i
#                                     dondurma aromas�, bir yerin ismi vb. " Onun sevdi�i aroma �ilek mi ? " gibi.


# Say�sal Veri & Quantitative Data -> Say�lsal veriler bir t�r �l��m sonucudur, basit matematik modelleri ile manip�le edilebilir.


# * Her veri t�r� i�in en iyi �izim y�ntemleri ya da grafik �e�idi farkl�d�r. 


mtcars        # "mtcars" datasetini incelemek i�in, " ?mtcars " komutu ile daha fazla bilgi al�nabilir. 

head(mtcars)  # "mtcars" datasetinin ilk 6 sat�r�n� g�rmek i�in

tail(mtcars)  # "mtcars" datasetinin son 6 sat�r�n� g�rmek i�in

summary(mtcars) # "mtcars" i�erisindeki verilerin h�zl�ca ortalama de�er, max, min vb. �zelliklerini g�rmek i�in.


# -- Bar Plots -- 


# ?qplot ile fonksiyon hakk�nda detayl� bilgiye ula��labilir.


#colour ile �er�eve rengi, fill ile i�erideki renk de�i�tirilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("black"), colour = I("blue"))  


# ggplot2 'de Renk kodlar� i�in = http://sape.inf.usi.ch/quick-reference/ggplot2/colour


# xlab, ve ylab ile eksenlere isim verilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles")


# main ile grafi�e genel isim verilebilir.
qplot(mtcars$cyl, geom = "bar", fill = I("blue"), xlab = "Cylinders", ylab = "Number of Vehicles", main = "Cylinders in mtcars")



