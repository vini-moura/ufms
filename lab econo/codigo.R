library(ggplot2);library(dplyr);library(tidyverse);
library(factoextra);library(datasets);library(hrbrthemes);library(cluster)

df <- mtcars[,c(4,6,1)]
summary(mtcars)
sd(df)

ggplot(df, aes(x=hp,y=wt, color=mpg))+
  geom_point(size=6)+
  labs(title = "Cavalos por Potência", x= "Cavalos", y= "Potência")+
  theme_ipsum()
  

fviz_nbclust(df, kmeans, method = "wss")

modelo <- kmeans(df[,c(1,2)], 4,nstart = 20)
table(modelo$cluster, df$mpg)
clusplot(df,modelo$cluster, color=TRUE, shade = TRUE)

summary(modelo$totss)
