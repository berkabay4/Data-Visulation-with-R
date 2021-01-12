# -- Basic Plots -- 


# -- Scatterplot (Daðýlým Grafiði) --


# Scatterplot iki veya daha fazla deðiþken arasýndaki deðerlerin konumunu götünütlemek için 
# noktalarý ve Kartezyen koordinat sistemini kullanýr. Scatterplot(Daðýlým Grafiði) 2D veya 3D çizmek mümkündür. 


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Araçlarýn mil baþýan harcadýðý galon yakýt ve aðýrlýklarýna göre bir daðýlým grafiði çizmek istersek;
qplot(mpg, wt, data=mtcars) 


# Ayný grafiði ggplot kullanarak çizmek istersek;
ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape=1)


# geom_point ile grafikte bulunan noktalarýn özelliklerini deðiþtirebilirsiniz.
# Shape deðiþkenini deðiþtirerek grafikte bulunan noktalarýn þeklini deðiþtirebilirsiniz.
ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape=19)


# Noktalarýn þekil veya renklerini deðiþtirerek 3. bir deðiþkene baðýmlý deðiþimlerini gösterebiliriz.
ggplot(mtcars,aes(x=mpg,y=wt,shape = cyl)) + geom_point() + scale_shape_identity()


# Yukarýdaki kodda ek olarak 3. bir deðiþken eklemediðimiz için deðiþimi göremeyebiliriz. 
# Bunun için arabalarýn mpg ve wt özelliklerine ek olarak silindir sayýsýna baðlý deðiþimini incelersek;


# Silindir sayýsýna baðlý deðiþim için öncelikle silindir deðerlerini faktör olarak tanýmlamamýz gerekli.
mtcars$cylFactor<- factor(mtcars$cyl)


# Faktör haline getirerek silindir deðeri hangi deðerlerden oluþuyor öðrenebiliriz. (Levels)  
# Faktör haline getirdiðimiz silindir deðerini grafiðimize 3. deðiþken olarak eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,shape = cylFactor)) + geom_point()


# Shape deðiþkenine eklediðimiz için her farklý þekil bize silindir sayýsýný belirtmekte.


# colour deðiþkenine deðer atayarak þekillerin rengini deðiþtirebiliriz.
ggplot(mtcars,aes(x=mpg,y=wt)) + geom_point(shape=19, colour="blue")


# Eðer silindir sayýsýný renk deðiþimi ile belirtmek istersek colour deðiþkenine silindir deðerini atayabilriz.
# Ancak silindir deðiþkenini faktör olarak deðil, vektör halde atarsak bu durumda gradyant bir renk deðiþimi elde ederiz.
ggplot(mtcars,aes(x=mpg,y=wt,color = cyl))+ geom_point(shape=19)


# Her bir seviyeyi tamamen farklý bir renkle ifade etmek istersek bu sefer colour deðerine silindir deðerini
# faktör olarak atarýz. Bu durumda;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19)


# Grafikte silindir sayýsý "cylFactor" olarak göründüðünden kullanýcý bunu anlamlandýramayabilir.
# 3. deðiþkenimize etiket eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + labs(colour = "Cylinders")


# X-Y eksenleri ve grafiðimizin baþlýðýný eklersek;
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + xlab("Miles per Gallon ") + ylab("Weight") +
  labs(colour = "Cylinders") + ggtitle("Scatterplot")

