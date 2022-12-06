pkgs <- c("readr", "jhuanglabGO", "tidyverse", "ggplot2", "matrixStats", "FactoMineR",
          "factoextra", "ComplexHeatmap")
for (pkg in pkgs){
  suppressPackageStartupMessages(library(pkg, character.only = T))
}
case <- snakemake@params[[1]] %>% strsplit(split = " ") %>% unlist()
control <- snakemake@params[[2]] %>% strsplit(split = " ") %>% unlist()
fpkm <- snakemake@params[[3]] %>% read_csv()
output_dir <- snakemake@params[[4]]
jhuanglabGO::pca_plot_rna(fpkm = fpkm, case = case, control = control, output_dir = output_dir)
jhuanglabGO::varied_genes_htmap(case, control, fpkm, top_n = 1000, output_dir)
