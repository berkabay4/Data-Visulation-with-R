# -- Linear Regression --


# Regresyon; iki ya da daha fazla de�i�ken aras�ndaki ili�kiyi �l�mek i�in kullan�lan bir analiz metodudur.
# Regresyon trendleri g�stermek ve tahminlerde(Predictions) bulunmak i�in harika bir yoldur.


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Kullanaca��m�z ilk y�ntem do�rusal regresyon, yani do�rusal modeli kullanan regresyon. 
# Bunu yapmak i�in, ek olarak "geom_smooth(method="lm", se= FALSE, color = ...)" kullanabiliriz. 
ggplot(mtcars,aes(x=mpg,y=wt))  + geom_point(shape=19) +
  geom_smooth(method="lm", se= FALSE, color = "red")

# "se  = FALSE" k�s�m� "confidence interval" dedi�imiz de�erin a��l�p/kapanmas� i�indir.
#  Bu de�er �izdi�imiz e�rinin %95 alt�nda ve �st�nde kesinlikte bulunan alanlar� g�sterir.


#se = TRUE  -> confidence interval appear (default = true)
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + geom_smooth(method="lm", se= TRUE, color = "red")


# Silindir say�s�na ba�l� de�i�im i�in �ncelikle silindir de�erlerini fakt�r olarak tan�mlamam�z gerekli.
mtcars$cylFactor<- factor(mtcars$cyl)


# 3. de�i�ken olarak silindir de�eri eklenirse; 
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + 
  geom_smooth(method="lm", se= TRUE, color = "red") + xlab("Miles per Gallon ") + 
  ylab("Weight") +  labs(colour = "Cylinders") + ggtitle("Linear Regression")


# -- Gaussian Regression Model --


# Gauss modeli; Lineer Regresyondaki gibi d�z bir �izgi yerine bir e�ri olarak kar��m�za ��kar.
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + 
  geom_smooth(method="auto", se= TRUE, color = "red") + xlab("Miles per Gallon ") + 
  ylab("Weight") +  labs(colour = "Cylinders") + ggtitle("Gaussian Regression")