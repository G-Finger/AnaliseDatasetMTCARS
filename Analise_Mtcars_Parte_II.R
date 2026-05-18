
# continuação da aula passada em R
# Bibliotecas
# Se você não tiver instalado na sua máquina

# library(tidyverse) possui a ggplot2

library(ggplot2)

# Importanto o dataset 

dados_carros<-datasets::mtcars

# Selecionar uma coluna numérica e realizar representação gráfica

plot(dados_carros$disp,
     dados_carros$hp,
     xlab = "Cilindrada (disp)",
     ylab = "Potência (hp)",
     main = "Relação entre Cilindrada e Potência",
     pch = 19,
     col= "blue")


# considerando que a coluna gear e carb são categóricas, escolha uma delas e faça uma 
# representação adequada.


dados_carros$gear <- as.factor(dados_carros$gear)

barplot(table(dados_carros$gear),
        main = "Quantidade de carros por número de marchas",
        xlab = "Número de marchas",
        ylab = "Quantidade de carros",
        col = "lightblue",
        ylim = c(0, 18))

# fazer uma distribuição gráfica entre mpg e hp. 

plot(dados_carros$hp,
     dados_carros$mpg,
     main = "Distribuição entre Potência e Consumo",
     xlab = "Potência (hp)",
     ylab = "Consumo (mpg)",
     pch = 19,
     col = "darkblue")

# verificar a relação entre as colunas vs e gear. 

?mtcars

barplot(table(dados_carros$VS),
        main = "Quantidade de carros por formato de motor",
        xlab = "0 - VShaped, 1 - Linear",
        ylab = "Quantidade de carros",
        col = "lightyellow",
        ylim = c(0, 20))
        


dados_carros$VS <- as.factor(dados_carros$vs)


barplot(table(dados_carros$VS,
              dados_carros$gear),
        beside = TRUE, # neste casos as barras irão ficar lado a lado. 
        col = c("lightblue","pink"),
        main = "Formato do motor vs número de marchas",
        xlab = "Formato do motor",
        ylab = "Quantidade")

legend("topright",
       legend = c("Motor em V",
                  "Motor em linha"),
       fill = c("lightblue","pink"))


# vamos verificar se a relação entre mpg e drat, e se muda com os níveis de carb. 

# transformar a coluna carb em factores

dados_carros$carb <- as.factor(dados_carros$carb)

ggplot(dados_carros,
       aes(x = drat,
           y = mpg,
           color = carb)) +
  
  geom_point(size = 2) +
  
  labs(title = "Relação entre mpg e drat por carb",
       x = "drat",
       y = "mpg",
       color = "carb") +
  
  theme_minimal()



cor(dados_carros$drat,
    dados_carros$mpg)
