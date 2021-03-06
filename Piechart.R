# -- Pie Charts -- 


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Pie Charts(Pasta Grafik) i� d�nyas�nda en �ok kullan�lan dairesel grafiklerdir.
# Verinin her bir b�l�m�n�n genel bir toplama katk�s�n�n oran�n� g�sterir. 


# Ggplot2'deki bir pasta grafik, d�n��t�r�lm�� bir stacked bar plottur (Y���lm�� �ubuk grafi�i).
barp <- ggplot(mtcars, aes(x=1, y=sort(mtcars$carb), fill=sort(mtcars$carb))) +geom_bar(stat="identity")
print(barp)


# �imdi bu stack bar grafi�ini pie chart 'a �evirmeliyiz. 
# E�er bu stack bar '� polar kordinatlarda �izersek bunu yapabiliriz.


# https://ibm.box.com/shared/static/me1bmbb54gneyr5epweqe88zg8ujkqst.gif"


barp <- barp + coord_polar(theta='y')
print(barp)


# theme ile polar kordinatlara ait eksenleri silebiliriz.
barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y=element_blank())
print(barp)


# Arka plan� kald�rmak i�in; 
barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y=element_blank(),
  panel.background=element_blank())
print(barp)


# Bilgilendirme i�in label(etiket) eklersek;
barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y=element_blank(),
  panel.background=element_blank()) +
  labs(y="Carburetors")
print(barp)






