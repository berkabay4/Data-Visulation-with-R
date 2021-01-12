# -- Radar Charts --

# Radar Charts çok deðiþken içeren veriler ile uðraþýrken kullanýþlýdýr. 
# Özellikle bir dizi deðiþken ile ilgili birçok özelliði göstermek konusunda kullanýlabilirler.
# Radar grafiklerinin bir uygulamasý, spor (Hýz, Denge, Kuvvet, ...) gibi belirli konularýn güçlü veya zayýf yönlerini göstermektir.
# Diðer bir örnek, pazarlama, yatýrým vb. Gibi birkaç kategoride farklý þirketlerin iþ yaklaþýmlarýný ayýrt etmektir.


if("devtools" %in% rownames(installed.packages()) == FALSE) {install.packages("devtools")}
library(devtools)

if("IRkernel" %in% rownames(installed.packages()) == FALSE) {install.packages("IRkernel")}
library(IRkernel)

# Installing the required packages and call librarys 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}


# Radar Chart çizebilmek için ek olarak;
devtools::install_github("ricardo-bion/ggradar",dependencies=TRUE)

# pipe komutunu kullanabilmek için;
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}

# Etiketleri otomatik olarak atayabilmemiz için;
if("scales" %in% rownames(installed.packages()) == FALSE) {install.packages("scales")}

library(ggplot2)
library(ggradar)
library(dplyr)
library(scales)


# Kullanýlacak dataset seçilir
mtcars %>%
  #atribute rownames to a variable
  add_rownames( var = "group" ) %>%
  #assign each variable -- car names -- to their related variables
  mutate_each(funs(rescale), -group) %>%
  #select which  data to plot
  head(3) %>% select(1:10) -> mtcars_radar



#this code will generate lots of warnings, so let's supress them
options(warn=-1)
ggradar(mtcars_radar)


IRkernel::set_plot_options(width=950, height=600, units='px')
ggradar(mtcars_radar)




