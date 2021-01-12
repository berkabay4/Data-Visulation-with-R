# -- Linear Regression --


# Regresyon; iki ya da daha fazla deðiþken arasýndaki iliþkiyi ölçmek için kullanýlan bir analiz metodudur.
# Regresyon trendleri göstermek ve tahminlerde(Predictions) bulunmak için harika bir yoldur.


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


# Kullanacaðýmýz ilk yöntem doðrusal regresyon, yani doðrusal modeli kullanan regresyon. 
# Bunu yapmak için, ek olarak "geom_smooth(method="lm", se= FALSE, color = ...)" kullanabiliriz. 
ggplot(mtcars,aes(x=mpg,y=wt))  + geom_point(shape=19) +
  geom_smooth(method="lm", se= FALSE, color = "red")

# "se  = FALSE" kýsýmý "confidence interval" dediðimiz deðerin açýlýp/kapanmasý içindir.
#  Bu deðer çizdiðimiz eðrinin %95 altýnda ve üstünde kesinlikte bulunan alanlarý gösterir.


#se = TRUE  -> confidence interval appear (default = true)
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + geom_smooth(method="lm", se= TRUE, color = "red")


# Silindir sayýsýna baðlý deðiþim için öncelikle silindir deðerlerini faktör olarak tanýmlamamýz gerekli.
mtcars$cylFactor<- factor(mtcars$cyl)


# 3. deðiþken olarak silindir deðeri eklenirse; 
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + 
  geom_smooth(method="lm", se= TRUE, color = "red") + xlab("Miles per Gallon ") + 
  ylab("Weight") +  labs(colour = "Cylinders") + ggtitle("Linear Regression")


# -- Gaussian Regression Model --


# Gauss modeli; Lineer Regresyondaki gibi düz bir çizgi yerine bir eðri olarak karþýmýza çýkar.
ggplot(mtcars,aes(x=mpg,y=wt,color = cylFactor)) + geom_point(shape=19) + 
  geom_smooth(method="auto", se= TRUE, color = "red") + xlab("Miles per Gallon ") + 
  ylab("Weight") +  labs(colour = "Cylinders") + ggtitle("Gaussian Regression")