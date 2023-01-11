

library(ggplot2)
library(plotrix)
library(circlize)
library(pacman)







tiff('Mutation_Circular_plot1.tiff', units="in", width=5, height=3.5, res=600, 
     compression = 'lzw')


category <- c("HGNC", "ADCY5", "APOC3", "BCL2","CDKN1A", "CTF1", "EGR1", "FEN1", "GDF11")

percent <- c(75, 65, 45, 69, 35, 44, 62, 80, 50)

color= c("#7C0A02", "#FAE7B5", "#7C0A02", "#FAE7B5", 
         "#7C0A02", "#FAE7B5", "#7C0A02", "#FAE7B5", "#7C0A02")




library(circlize)
circos.par("start.degree" = 90, cell.padding = c(0, 0, 0, 0))
circos.initialize("a", xlim = c(0, 100)) # 'a` just means there is one sector
circos.track(ylim = c(0.5, length(percent)+0.5), track.height = 0.8, 
             bg.border = NA, panel.fun = function(x, y) {
               xlim = CELL_META$xlim
               circos.segments(rep(xlim[1], 9), 1:9,
                               rep(xlim[2], 9), 1:9,
                               col = "#CCCCCC")
               circos.rect(rep(0, 9), 1:9 - 0.45, percent, 1:9 + 0.45,
                           col = color, border = "white")
               circos.text(rep(xlim[1], 9), 1:9, 
                           paste(category, " - ", percent, "%"), 
                           facing = "downward", adj = c(1.05, 0.5), cex = 0.8) 
               breaks = seq(0, 85, by = 5)
               circos.axis(h = "top", major.at = breaks, labels = paste0(breaks, "%"), 
                           labels.cex = 0.6)
             })



circos.clear()

dev.off()
