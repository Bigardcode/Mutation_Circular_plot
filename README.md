# ![Mutation circular Plot](https://github.com/Bigardcode/Mutation_Circular_plot/assets/84800557/401bda4a-cb4e-49a3-9e86-eb66bb05d899)



# Gene mutation Circular Plot


## Getting Started

In genetics, the mutation rate is the frequency of new mutations in a single gene 
or organism over time.Mutation rates are not constant and are not limited to a 
single type of mutation;there are many different types of mutations. Mutation 
rates are given for specific classesof mutations. Point mutations are a class of
 mutations which are changes to a single base.Missense and Nonsense mutations 
are two subtypes of point mutations. The rate of these types of substitutionscan
 be further subdivided into a mutation spectrum which describes the influence 
of the genetic context on the mutation rate

## Installation and load R libraries



    ### Step_1 Downloading R pakchaes

     if (!requireNamespace("BiocManager", quietly = TRUE))
     install.packages("BiocManager")

     BiocManager::install(c("ggplot2", "pacman", " plotrix", "DMRcate", " circlize", " dplyr"))

     ### Step_2 Loading libraries

    library(ggplot2)
    library(plotrix)
    library(circlize)
    library(pacman)


## Creating seperate category for each gene percentage of mutations

        ### Step_1 Creat a list of genes 
        category <- c("HGNC", "ADCY5", "APOC3", "BCL2","CDKN1A", "CTF1", "EGR1", "FEN1", "GDF11")

        ### Step_2 Creat a list of pecentae of mutations
        percent <- c(75, 65, 45, 69, 35, 44, 62, 80, 50)



## Creating Circular polot for pcentae of mutation pe gene


     color= c("#7C0A02", "#FAE7B5", "#7C0A02", "#FAE7B5", "#7C0A02", "#FAE7B5", "#7C0A02", "#FAE7B5", "#7C0A02")


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

