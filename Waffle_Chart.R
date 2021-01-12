# -- Waffle Chart -- 

# Waffle Chart, verilerin bir bütünle iliþkisini göstermek için kullanýlabilir.
# Ya da birden çok veri ile Pie Chart yapmaya çalýþmak yerine Waffle Chart kullanýlabilir.
# Bu grafikler genellikle izleyicinin anlaþýlmasýna yardýmcý olmak için diðer veri görselleþtirme türlerini takip eder.


# ggplot2 harici bir kütüphane olduðu için yüklü deðil ise yükle. 
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