
getwd()

ACC <- read.delim("../documents/posdoc_Gymnodinium_catenatum/qPCR/expresion_relativa/expresion_ACC.txt")

levels(ACC$salinidad)

#esto me ayuda a ordenar los datos de acuerdo a las variables

ACC$salinidad <- ordered(ACC$salinidad,
                         levels = c("20", "25", "30", "35", "40"))

levels(ACC$salinidad)

library(dplyr)

group_by(ACC, salinidad) %>%
  summarise(count = n(),
            mean = mean(Cq, na.rm = TRUE),
            sd = sd(Cq, na.rm = TRUE))

install.packages("ggpubr")

library("ggpubr")

ggboxplot(ACC, x = "salinidad", y = "Cq",
          color = "salinidad", palette = c("#00AFBB", "#E7B800", "#FC4E07", "#61D04F", "#CD0BBC"),
          order = c("20", "25", "30", "35", "40"),
          ylab = "Cq", xlab = "salinidad")

res.aov <- aov(Cq ~ salinidad, data = ACC)

summary(res.aov)

Tukey <- TukeyHSD(res.aov)

print(Tukey)


# Crear un data frame con los valores proporcionados
data_tukey <- data.frame(
  Comparacion = c("25-20", "30-20", "35-20", "40-20", "30-25", "35-25", "40-25", "35-30", "40-30", "40-35"),
  Diferencia_Media = c(-0.15441222, 0.70033025, -0.11734989, 0.13976361, 0.85474246, 0.03706232, 0.29417583, -0.81768014, -0.56056664, 0.25711350),
  Limite_Inferior = c(-0.31203558, 0.54270688, -0.27497326, -0.01785975, 0.69711910, -0.12056104, 0.13655246, -0.97530351, -0.71819000, 0.09949014),
  Limite_Superior = c(0.003211148, 0.857953611, 0.040273469, 0.297386973, 1.012365826, 0.194685685, 0.451799189, -0.660056778, -0.402943274, 0.414736868),
  Valor_P_Ajustado = c(0.0554809, 0.0000004, 0.1789091, 0.0889143, 0.0000001, 0.9325457, 0.0008043, 0.0000001, 0.0000029, 0.0022615)
)

# Ver el data frame resultante
print(data_tukey)

#esto me va apermitir ver los grupos que se forman a partir
#de los datos de la prueba de Tukey

alpha <- 0.05
etiquetas_grupo <- character(length(data_tukey$Valor_P_Ajustado))

etiquetas_grupo[data_tukey$Valor_P_Ajustado < alpha] <- "grupoA"
etiquetas_grupo[data_tukey$Valor_P_Ajustado >= alpha] <- "grupoB"

data_tukey$grupos <- etiquetas_grupo

print(data_tukey)
