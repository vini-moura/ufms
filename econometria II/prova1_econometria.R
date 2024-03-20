library(rbcb); library(esquisse)
library(fpp3); library(tseries)
library(ggplot2); library(forecast)

#pib municipios ms tabela5938all = get_sidra(api = "/t/5938/n6/5000708,5001102,5003207,5005202,5005608,5006903,5002605,5003306,5006408,5007406,5001003,5002902,5004403,5006309,5000906,5002100,5002209,5002803,5004106,5005004,5005806,5001508,5002704,5003108,5004908,5005400,5007109,5007208,5007307,5007505,5007901,5008008,5000203,5002308,5008305,5000609,5000807,5001904,5002001,5002407,5003702,5003801,5004007,5004304,5004502,5004700,5005103,5005707,5006200,5006606,5002159,5003256,5007695,5007935,5002951,5003488,5007554,5007802,5003504,5004601,5005152,5007703,5007950,5007976,5008404,5003157,5006358,5000856,5001243,5003454,5003751,5005681,5000252,5004809,5005251,5006002,5006259,5003900,5006275/v/37/p/2016/d/v37%200")

df <- get_series(21990) 
colnames(df) <- c("data","serie")
serie <- matrix(df$serie) %>% ts(c(1996,1), frequency = 12)


#Visualizar as séries ----
ggplot(df, aes(x=data,y=serie))+
  geom_line(color="blue")+
  geom_point()+
  labs(title = "Empregos Formais No MS", x="Tempo", y="", caption="Elaboração própria com dados do BCB - 18/03/24")


seasonplot(serie, ylab = "Empregos", xlab="Mês", 
           main="Gráfico Sazonal: Empregos Formais no MS", caption='Elaboração Própria com Dados do BCB',
           year.labels = TRUE, col=1:336)

monthplot(serie)


print(c(mean(dados.ts), sd(dados.ts)))
print(c(min(dados.ts),max(dados.ts)))


# informar principais características conforme teoria de série temporal ----
"
pelo gráfico ggplot percebe-se que há variância na sua amplitude, indicando que não é estática
a média da série está em 758.60 e o desvio padrão em 3187.80 empregos
A menor observação é -15.103 e a maior é 7.316
Pelo season plot vemos que tem uma sazonalidade negativa forte em dezembro
também percebemos que em geral o segundo semestre tem menos emprego gerado que no primeiro
"


# amostras treino e teste ----
sample <- sample(c(TRUE, FALSE), nrow(serie), replace=TRUE, prob=c(0.7,0.3))
treino <- serie[sample,]
teste <- serie[!sample,]



# Fazer forecast 24 meses a frente em diferentes métodos ----




# Fazer combinação de forecast ----


# Explicar o melhor método com base nas acurácias, obrigatoriamente contendo o RMSE, MAE e MASE ----

