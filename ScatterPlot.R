# -- Basic Plots -- 


# -- Scatterplot (Da��l�m Grafi�i) --


# Scatterplot iki veya daha fazla de�i�ken aras�ndaki de�erlerin konumunu g�t�n�tlemek i�in 
# noktalar� ve Kartezyen koordinat sistemini kullan�r. Scatterplot(Da��l�m Grafi�i) 2D veya 3D �izmek m�mk�nd�r. 


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Ara�lar�n mil ba��an harcad��� galon yak�t ve a��rl�klar�na g�re bir da��l�m grafi�i �izmek istersek;
qplot(mpg, wt, data=mtcars) 


# Ayn� grafi�i ggplot kullanarak �izmek istersek;
ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape=1)


# geom_point ile grafikte bulunan noktalar�n �zelliklerini de�i�tirebilirsiniz.
# Shape de�i�kenini de�i�tirerek grafikte bulunan noktalar�n �eklini de�i�tirebilirsiniz.
ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape=19)


# Noktalar�n �ekil veya renklerini de�i�tirerek 3. bir de�i�kene ba��ml� de�i�imlerini g�sterebiliriz.
ggplot(mtcars,aes(x=mpg,y=wt,shape = cyl)) + geom_point() + scale_shape_identity()


# Yukar�daki kodda ek olarak 3. bir de�i�ken eklemedi�imiz i�in de�i�imi g�remeyebiliriz. 
# Bunun i�in arabalar�n mpg ve wt �zelliklerine ek olarak silindir say�s�na ba�l� de�i�imini incelersek;


# Silindir say�s�na ba�l� de�i�im i�in �ncelikle silindir de�erlerini fakt�r olarak tan�mlamam�z gerekli.
mtcars$cylFactor<- factor(mtcars$cyl)


# Fakt�r haline getirerek silindir de�eri hangi de�erlerden olu�uyor ��renebiliriz. (Levels)  
# Fakt�r haline getirdi�imiz silindir de�erini grafi�imize 3. de�i�ken olarak eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,shape = cylFactor)) + geom_point()


# Shape de�i�kenine ekledi�imiz i�in her farkl� �ekil bize silindir say�s�n� belirtmekte.


# colour de�i�kenine de�er atayarak �ekillerin rengini de�i�tirebiliriz.
ggplot(mtcars,aes(x=mpg,y=wt)) + geom_point(shape=19, colour="blue")


# E�er silindir say�s�n� renk de�i�imi ile belirtmek istersek colour de�i�kenine silindir de�erini atayabilriz.
# Ancak silindir de�i�kenini fakt�r olarak de�il, vekt�r halde atarsak bu durumda gradyant bir renk de�i�imi elde ederiz.
ggplot(mtcars,aes(x=mpg,y=wt,color = cyl))+ geom_point(shape=19)


# Her bir seviyeyi tamamen farkl� bir renkle ifade etmek istersek bu sefer colour de�erine silindir de�erini
# fakt�r olarak atar�z. Bu durumda;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19)


# Grafikte silindir say�s� "cylFactor" olarak g�r�nd���nden kullan�c� bunu anlamland�ramayabilir.
# 3. de�i�kenimize etiket eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + labs(colour = "Cylinders")


# X-Y eksenleri ve grafi�imizin ba�l���n� eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + xlab("Miles per Gallon ") + ylab("Weight") +
  labs(colour = "Cylinders") + ggtitle("Scatterplot")

