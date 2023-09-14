fabz <- read.delim("../qPCR/expresion_relativa/expresión_Fabz.txt")

print(fabz)

fabz$salinidad <- ordered(fabz$salinidad,
                          levels = c("20", "25", "30", "35", "40"))

levels(fabz$salinidad)

library(dplyr)

group_by(fabz, salinidad) %>%
  summarise(count = n(),
            mean = mean(Fold, na.rm = TRUE),
            sd = sd(Fold, na.rm = TRUE))


library(ggpubr)

ggboxplot(fabz, x = "salinidad", y = "Fold",
          color = "salinidad",
          order = c("20", "25", "30", "35", "40"),
          ylab = "Fold", xlab = "salinidad")

res.aov <- aov(Fold ~ salinidad, data = fabz)

summary(res.aov)

Tukey <- TukeyHSD(res.aov)
print(Tukey)

data_tukey <- data.frame(
  comparación = c("25-20", "30-20", "35-20", "40-20", "30-25", "35-25", "40-25", "35-30", "40-30", "40-35"),
  diferencia_media = c(0.4663, 0.4914, 0.5306, -0.3538, 0.0251, 0.0642, -0.8202, 0.0391, -0.8453, -0.8845),
  limite_inferior = c(-0.3703, -0.3452, -0.3060, -1.1905, -0.8115, -0.7724, -1.6569, -0.7975, -1.6820, -1.7211),
  limite_superior = c(1.3030, 1.3281, 1.3672, 0.4827, 0.8617, 0.9009, 0.0164, 0.8758, -0.0086, -0.0478),
  P_ajustado = c(0.4070, 0.3608, 0.2961, 0.6456, 0.9999, 0.9989, 0.0552, 0.9998, 0.0474, 0.0373))
)
install.packages("agricolae")

#realizar mejor el análisis de Tukey con la libreria agricolae, este me permite
#ver los grupos homogéneos

library(agricolae)

Tukey_nuevo <- HSD.test(res.aov, "salinidad", group = TRUE)

plot(Tukey_nuevo)
resultados <- Tukey_nuevo$groups
