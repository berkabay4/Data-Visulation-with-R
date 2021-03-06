# -- Radar Charts --

# Radar Charts �ok de�i�ken i�eren veriler ile u�ra��rken kullan��l�d�r. 
# �zellikle bir dizi de�i�ken ile ilgili bir�ok �zelli�i g�stermek konusunda kullan�labilirler.
# Radar grafiklerinin bir uygulamas�, spor (H�z, Denge, Kuvvet, ...) gibi belirli konular�n g��l� veya zay�f y�nlerini g�stermektir.
# Di�er bir �rnek, pazarlama, yat�r�m vb. Gibi birka� kategoride farkl� �irketlerin i� yakla��mlar�n� ay�rt etmektir.


if("devtools" %in% rownames(installed.packages()) == FALSE) {install.packages("devtools")}
library(devtools)

if("IRkernel" %in% rownames(installed.packages()) == FALSE) {install.packages("IRkernel")}
library(IRkernel)

# Installing the required packages and call librarys 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}


# Radar Chart �izebilmek i�in ek olarak;
devtools::install_github("ricardo-bion/ggradar",dependencies=TRUE)

# pipe komutunu kullanabilmek i�in;
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}

# Etiketleri otomatik olarak atayabilmemiz i�in;
if("scales" %in% rownames(installed.packages()) == FALSE) {install.packages("scales")}

library(ggplot2)
library(ggradar)
library(dplyr)
library(scales)


# Kullan�lacak dataset se�ilir
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




