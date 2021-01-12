# -- Pie Charts -- 


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Pie Charts(Pasta Grafik) iþ dünyasýnda en çok kullanýlan dairesel grafiklerdir.
# Verinin her bir bölümünün genel bir toplama katkýsýnýn oranýný gösterir. 


# Ggplot2'deki bir pasta grafik, dönüþtürülmüþ bir stacked bar plottur (Yýðýlmýþ çubuk grafiði).
barp <- ggplot(mtcars, aes(x=1, y=sort(mtcars$carb), fill=sort(mtcars$carb))) +geom_bar(stat="identity")
print(barp)


# Þimdi bu stack bar grafiðini pie chart 'a çevirmeliyiz. 
# Eðer bu stack bar 'ý polar kordinatlarda çizersek bunu yapabiliriz.


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


# Arka planý kaldýrmak için; 
barp <- barp + coord_polar(theta='y')
barp <- barp + theme(
  axis.line=element_blank(),
  axis.text.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks=element_blank(),
  axis.title.y=element_blank(),
  panel.background=element_blank())
print(barp)


# Bilgilendirme için label(etiket) eklersek;
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






