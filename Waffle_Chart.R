# -- Waffle Chart -- 

# Waffle Chart, verilerin bir b�t�nle ili�kisini g�stermek i�in kullan�labilir.
# Ya da birden �ok veri ile Pie Chart yapmaya �al��mak yerine Waffle Chart kullan�labilir.
# Bu grafikler genellikle izleyicinin anla��lmas�na yard�mc� olmak i�in di�er veri g�rselle�tirme t�rlerini takip eder.


# ggplot2 harici bir k�t�phane oldu�u i�in y�kl� de�il ise y�kle. 
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)


if("waffle" %in% rownames(installed.packages()) == FALSE) {install.packages("waffle")}
library(waffle)


expenses <- c(`Health ($43,212)`=43212, `Education ($113,412)`=113412,
              `Transportation ($20,231)`=20231, `Entertainment ($28,145)`=28145)

waffle(expenses/1235, rows=5, size=0.3, 
       colors=c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf"), 
       title="Imaginary Household Expenses Each Year", 
       xlab="1 square = $934")


# IRkernel::set_plot_options(width=950, height=600, units='px')
# waffle(expenses/1235, rows=5, size=0.3, 
#        colors=c("#c7d4b6", "#a3aabd", "#a0d0de", "#97b5cf"), 
#        title="Imaginary Household Expenses Each Year", 
#        xlab="1 square = $934")