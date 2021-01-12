# -- Box Plots --

# Box Plot, verilerdeki daðýlým (yayýlma) ve çarpýklýk derecesini temsil etmenin 
# ve altta yatan istatistiksel daðýlýmýn herhangi bir varsayýmýný yapmadan aykýrý
# deðerleri göstermenin uygun bir yoludur


if("plotly" %in% rownames(installed.packages()) == FALSE) {install.packages("plotly")}
library(plotly)


# Çizimi yapýlacak deðerlerin üretilmes, ;
set.seed(1234)

set_a <- rnorm(200, mean=1, sd=2)
set_b <- rnorm(200, mean=0, sd=1)

df <- data.frame(label = factor(rep(c("A","B"), each=200)), value = c(set_a, set_b))

head(df)
tail(df)


ggplot(df, aes(x=label, y=value)) + geom_boxplot()

ggplotly()


# Box Plot yapýsý

# DATASET = 77, 79, 80 ,87, 87, 94, 99 olsun;
  
#   Upper Whisker   99            |                    
#   3rd Quartile    (87+94)/2     |           
#   Mean                          | --> Interquartile Range (IQR)   
#   Median         (86+87)/2      |     
#   1st Quartile  (79+80)/2       |           
#   Lower Whisker   77            |



