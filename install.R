#con este comando puedo instalar cualquier paquetería

install.packages("tidyverse", dep = TRUE)

#el comando "library" abre toda la librería de la paquetería que quiero
library(tidyverse)

install.packages("magic", dep = TRUE)

library(magic)
magic(6)

installed.packages()
