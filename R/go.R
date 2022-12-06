pkgs <- c("fs", "futile.logger", "ggpubr", "configr", "stringr", "ggthemes",
          "jhtools", "glue", "ggsci", "patchwork", "tidyverse", "dplyr",
          "DESeq2", "clusterProfiler", "ComplexHeatmap", "matrixStats", "FactoMineR",
          "factoextra", "jhuanglabGO")
for (pkg in pkgs){
  suppressPackageStartupMessages(library(pkg, character.only = T))
}

species <- snakemake@params[[1]]
output_dir <- snakemake@params[[2]]
res <- snakemake@params[[3]] %>% readxl::read_excel()
jhuanglabGO::get_GO_enrichment(diff = res, output_dir = output_dir, species = species)
