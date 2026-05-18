
# Bibliotecas
# Se você não tiver instalado na sua máquina

#install.packages("tidyverse") # dplyr está dentro do Tidyverse
#install.packages("dplyr")

# chamando as bibliotecas
library(dplyr)
library(tidyverse)

# Importanto o dataset 

dados_carros<-datasets::mtcars
View(dados_carros)
head(dados_carros,5)

# estrutura dos dados
str(dados_carros)

# Sobre o data set

?mtcars

# Vamos aprender sobre o "$"

#Autonomia
summary(dados_carros$mpg)


#POtência dos Veículos

summary(dados_carros$hp)

which.min(dados_carros$hp)

dados_carros$car_type<-rownames(dados_carros)

dados_carros$car_type[which.min(dados_carros$hp)]

#Distância entre eixos 

summary(dados_carros$drat)

#Peso dos Veículos 

summary(dados_carros$wt)

#Tempo para percorrer 1/4 de milha

summary(dados_carros$qsec)


# colocando o nome dos carro na última linha

# transformar rownames em coluna
dados_carros$car_type <- rownames(dados_carros)

# Dados categóricos

dados_carros$gear <- as.factor(dados_carros$gear)

unique(dados_carros$gear)

str(dados_carros$gear)

dados_carros$gear <- factor(
                      dados_carros$gear,
                      levels = c(3,4,5),
                      labels = c("3 marchas",
                                 "4 marchas",
                                 "5 marchas")
                            )

# Calculando a media e desvio padrão para cada tipo gear em relação ao consumo

marchas<- dados_carros%>%
          group_by(gear)%>%
          summarise(media = mean(mpg), devio_padrao = sd (mpg))

marchas
# Calculando a correção de Pearson entre as colunas mpg e hp

cor(dados_carros$mpg,
    dados_carros$hp,
    method = "pearson")

?cor

mediana_drat <- median(dados_carros$drat)
mediana_drat
calculo <- dados_carros %>%
           filter(drat > mediana_drat) %>%
           summarise(media_mpg = mean(mpg))

calculo

method = "pearson")

cor(dados_carros$drat,
    dados_carros$mpg,
    method = "pearson")
