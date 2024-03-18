library(rbcb); library(esquisse)
library(fpp3); library(tseries)
library(ggplot2)

nomes <- c("data","serie")
df <- get_series(21990)
colnames(df) <- nomes
dados <- matrix(df[,2])
dados.ts <- ts(dados, c(1996,1), frequency = 12)


#Visualizar as séries ----
ggplot(df, aes(x=data,y=serie))+
  geom_line()+
  labs(title = "Empregos Formais No MS", x="Tempo", y="", caption="Elaboração própria com dados do BCB - 18/03/24")


#amostras treino e teste ----
sample <- sample(c(TRUE, FALSE), nrow(df), replace=TRUE, prob=c(0.7,0.3))
treino <- df[sample,]
teste <- df[!sample,]


# informar principais características conforme teoria de série temporal ----
summary(df)
sd(df$serie)



# Fazer forecast 24 meses a frente em diferentes métodos ----




# Fazer combinação de forecast ----


# Explicar o melhor método com base nas acurácias, obrigatoriamente contendo o RMSE, MAE e MASE ----