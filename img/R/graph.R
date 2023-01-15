library(tidyverse)
library(ggplot2)
library(tikzDevice)

data = read_csv("img/logs/demo.log")

tikz(console = TRUE, width=5, height=4, timestamp = FALSE, verbose = FALSE)
ggplot(data, aes(x = x, y = y)) +
        geom_line() +
        theme_bw()
null = dev.off()
