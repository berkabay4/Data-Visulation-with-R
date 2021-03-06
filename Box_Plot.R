# -- Box Plots --

# Box Plot, verilerdeki da��l�m (yay�lma) ve �arp�kl�k derecesini temsil etmenin 
# ve altta yatan istatistiksel da��l�m�n herhangi bir varsay�m�n� yapmadan ayk�r�
# de�erleri g�stermenin uygun bir yoludur


if("plotly" %in% rownames(installed.packages()) == FALSE) {install.packages("plotly")}
library(plotly)


# �izimi yap�lacak de�erlerin �retilmes, ;
set.seed(1234)

set_a <- rnorm(200, mean=1, sd=2)
set_b <- rnorm(200, mean=0, sd=1)

df <- data.frame(label = factor(rep(c("A","B"), each=200)), value = c(set_a, set_b))

head(df)
tail(df)


ggplot(df, aes(x=label, y=value)) + geom_boxplot()

ggplotly()


# Box Plot yap�s�

# DATASET = 77, 79, 80 ,87, 87, 94, 99 olsun;
  
#   Upper Whisker   99            |                    
#   3rd Quartile    (87+94)/2     |           
#   Mean                          | --> Interquartile Range (IQR)   
#   Median         (86+87)/2      |     
#   1st Quartile  (79+80)/2       |           
#   Lower Whisker   77            |



