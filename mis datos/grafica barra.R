library(ggplot2)

                     
mi_dataframe <- data.frame(salinidad = c(20, 25, 30, 35, 40),
                           fold = c(0.30, 0.14, 1.00, 0.18, 0.44),
                           desviacion = c(0.04, 0.02, 0.05, 0.02, 0.10))

grafico_barra <- ggplot(data = mi_dataframe, aes(x = salinidad, y = fold)) +
  geom_bar(stat = "identity", fill = "darkgrey", position = "identity", width = 3) +
  geom_bar(stat = "identity", fill = "transparent", color = "black", width = 3) +
  geom_errorbar(aes(ymin = fold - desviacion, ymax = fold + desviacion),
                width = 0.1,
                position = position_dodge(0.9)) +
  labs(title = "expression ACC", x = "salinity", y = "Fold") +
  theme_classic(base_size = 9)

grafico_barra + ylim(0, 1.20)

print(grafico_barra)

