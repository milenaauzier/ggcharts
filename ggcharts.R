library(ggplot2)
library(dplyr)
library(ggcharts)
library(readr)
library(readxl)

df <- read_excel("C:/Users/milen/Desktop/Trabalhos/Trab Deise/Dados/dados prontos p analise/idhm_1.xlsx")

colnames(df) <- c('estados', 'regiao', 'indice', 'idhm_2000', 'idhm_2010', 'idhm_2017')

df$estados <- factor(df$estados, levels = as.character(df$estados))

chart <- dumbbell_chart(df, 
                        x = estados, 
                        y1 = idhm_2000,
                        y2 = idhm_2010,
                        limit = 10,
                        point_size = 5,
                        point_colors = c("deepskyblue2", "darkorchid3"), 
                        legend_labels = c("2000", "2017"))

chart +
  theme(
  plot.title = element_text(color = "gray92", 
                              face = "bold", 
                              margin = margin(10,0,10,0),
                              size = 16, 
                              hjust = 0.5),
    plot.caption.position = "plot", 
    plot.caption = element_text(hjust = 2))+
  labs(
    title = "Índice de Desenvolvimento Humano", 
    subtitle = "TOP 10 Estados Mais Desenvolvidos do Brasil", 
    caption = "Fonte:PNUD Brasil ")+
   xlab(NULL)+
   ylab("IDH")+
   #theme_hermit(axis = "y", grid = "Y")
   theme_nightblue()
